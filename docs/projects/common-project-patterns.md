# Common Raspberry Pi Project Patterns

This file gives LLMs practical patterns to combine with official facts. Treat these as curated guidance, not replacement specifications.

Sources:

- Raspberry Pi documentation: https://www.raspberrypi.com/documentation/
- Raspberry Pi remote access docs: https://www.raspberrypi.com/documentation/computers/remote-access.html
- Raspberry Pi camera software docs: https://www.raspberrypi.com/documentation/computers/camera_software.html

## Headless Server

Good for: dashboards, small APIs, local automation, MQTT, DNS, file sync.

Baseline:

```bash
sudo apt update
sudo apt full-upgrade
sudo systemctl enable --now ssh
hostnamectl
ip addr
```

Use systemd services for apps. Store app config in `/etc/app-name/` or project `.env` files with correct permissions. Keep logs in journald unless the app needs its own log rotation.

## Portable Access Point

Good for: field tools, local dashboards, setup portals, isolated sensor networks.

Decisions:

- Is the Pi a pure AP, routed AP, bridge, or VPN gateway?
- Which interface provides upstream internet?
- Does the Wi-Fi chipset support AP mode reliably?
- Is the regulatory domain set?

Useful commands:

```bash
iw list | grep -A 10 'Supported interface modes'
nmcli device status
sudo journalctl -u NetworkManager -b
```

## Camera or Vision Node

Good for: inspection, time-lapse, object detection, remote monitoring.

Baseline:

```bash
rpicam-hello --list-cameras
rpicam-still -o test.jpg
vcgencmd measure_temp
```

Plan lighting, focus, mounting rigidity, storage write rate, network bandwidth, and thermal control before tuning models.

## GPIO Automation

Good for: sensors, relays, buttons, LEDs, displays, serial devices.

Rules:

- Use BCM numbering in code.
- Include physical pin numbers in wiring docs.
- Use level shifting for 5 V devices.
- Use transistor/MOSFET/relay driver boards for loads.
- Do not power motors from 3.3 V pins.

## Local LLM or AI Edge Node

Good for: small models, local inference, camera + AI, wake word, classification, embeddings.

Pi 5 is the practical baseline. Use cooling, fast storage, and realistic expectations. AI HAT/AI HAT+ workflows are accelerator-specific. CPU-only LLMs can work for small quantized models but are not equivalent to desktop GPU inference.

Ask:

- Model size and quantization.
- Latency target.
- RAM size.
- Accelerator present.
- Is the workload text, image, audio, or multimodal?

## Fleet or Lab Management

Use:

- Immutable images where possible.
- SSH keys, not shared passwords.
- Hostname and labels per device.
- `rsync` or configuration management for repeatable deployment.
- Network boot or image cloning for labs.
- Logs and metrics if devices must run unattended.
