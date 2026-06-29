# Systemd Services and Scripts

Use this for repeatable Raspberry Pi processes: bots, sensor collectors, camera capture loops, local APIs, dashboards, AP helpers, sync jobs, and startup scripts.

Sources:

- Raspberry Pi OS docs: https://www.raspberrypi.com/documentation/computers/os.html
- Debian and systemd behavior applies to Raspberry Pi OS.

## Prefer systemd Over Startup Hacks

Use systemd services instead of `rc.local`, desktop autostart, or backgrounding commands in `.bashrc`.

Good service properties:

- Explicit working directory.
- Explicit user.
- Restart policy.
- Logs visible through `journalctl`.
- Environment file with secrets excluded from git.

## Python App Service Template

Create `/etc/systemd/system/my-pi-app.service`:

```ini
[Unit]
Description=My Raspberry Pi App
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=pi
WorkingDirectory=/home/pi/my-pi-app
EnvironmentFile=-/etc/my-pi-app.env
ExecStart=/home/pi/my-pi-app/.venv/bin/python /home/pi/my-pi-app/app.py
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
```

Enable:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now my-pi-app.service
systemctl status my-pi-app.service
journalctl -u my-pi-app.service -f
```

## Shell Script Service Template

```ini
[Unit]
Description=My Raspberry Pi Shell Worker
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=pi
WorkingDirectory=/home/pi/worker
ExecStart=/home/pi/worker/run.sh
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Make scripts strict:

```bash
#!/usr/bin/env bash
set -euo pipefail
```

## Timers Instead of Cron

For tasks that run periodically, use a `.timer` plus a `.service`.

Example `/etc/systemd/system/sensor-upload.timer`:

```ini
[Unit]
Description=Run sensor upload every 5 minutes

[Timer]
OnBootSec=2min
OnUnitActiveSec=5min
Unit=sensor-upload.service

[Install]
WantedBy=timers.target
```

Commands:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now sensor-upload.timer
systemctl list-timers
```

## Debug Checklist

```bash
systemctl status service-name
journalctl -u service-name -b
systemctl cat service-name
systemctl show service-name --property=User,WorkingDirectory,ExecStart
```

Common failures:

- Relative paths that only worked in an interactive shell.
- Missing environment variables.
- Running as root when file ownership expects a normal user, or the reverse.
- Starting before network time, Wi-Fi, camera, or storage is ready.
- Python package installed in a different virtual environment.

## LLM Guidance

When generating services, ask:

- Which user should run the process?
- Does it need network, camera, GPIO, serial, Docker, or mounted storage?
- Where are logs and config stored?
- Should it restart on failure or exit cleanly?
- Is the service safe to run before login?
