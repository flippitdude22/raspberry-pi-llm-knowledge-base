# Security Hardening

Sources:

- Raspberry Pi configuration documentation: https://www.raspberrypi.com/documentation/computers/configuration.html
- Remote access documentation: https://www.raspberrypi.com/documentation/computers/remote-access.html
- Debian security practices apply to Raspberry Pi OS because it is Debian-based.

## Baseline

```bash
sudo apt update
sudo apt full-upgrade
sudo reboot
```

Create named users. Do not rely on old default credentials. Current Raspberry Pi OS images require user creation.

## SSH

Enable SSH:

```bash
sudo systemctl enable --now ssh
```

Prefer public key authentication:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

Harden `/etc/ssh/sshd_config.d/*.conf` with project-appropriate settings:

```text
PasswordAuthentication no
PermitRootLogin no
PubkeyAuthentication yes
```

Then:

```bash
sudo systemctl reload ssh
```

Keep an existing SSH session open while testing a new one.

## Firewall

For simple hosts:

```bash
sudo apt install ufw
sudo ufw allow ssh
sudo ufw enable
sudo ufw status verbose
```

For routers, APs, VPN gateways, Kubernetes, Docker, or lab systems, inspect nftables/iptables interactions before enabling UFW.

## Secrets

Never commit or expose:

- Wi-Fi passwords.
- `/etc/ssh/ssh_host_*` private keys.
- User private keys.
- API tokens.
- VPN private keys.
- `wpa_supplicant.conf` or NetworkManager profiles containing PSKs.

## Network Services Audit

```bash
ss -tulpn
systemctl --type=service --state=running
sudo journalctl -p warning -b
```

Disable what is not needed:

```bash
sudo systemctl disable --now service-name
```

## Physical and GPIO Safety

- GPIO is 3.3 V only and not 5 V tolerant.
- Use level shifting for 5 V sensors or microcontrollers.
- Use fuses, buck converters, and proper common ground planning for robotics and battery projects.
- Avoid exposing a Pi with GPIO wiring where accidental shorts can occur.
