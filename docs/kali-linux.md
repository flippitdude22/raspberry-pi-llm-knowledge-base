# Kali Linux on Raspberry Pi

Kali Linux runs excellently on both Raspberry Pi 5 and Pi Zero 2 W. Hardware support is essentially identical to Raspberry Pi OS for GPIO, camera, wireless, and PCIe.

## Installation Tips
- Use official Kali Raspberry Pi images when available, or start from Raspberry Pi OS and install Kali tools.
- For wireless pentesting (Pwnagotchi, monitor mode, injection): Ensure compatible Wi-Fi chipset or use external adapters.
- Pi Zero 2 W onboard Wi-Fi works for many tasks but is limited to 2.4 GHz client/AP modes.

## Configuration
Use the same `config.txt` parameters documented in this repository. `raspi-config` may be missing or limited — edit files directly.

## Recommended Packages & Tools
- `hostapd`, `dnsmasq`, `aircrack-ng` suite, `bettercap`, `kismet`
- GPIO libraries: `gpiozero`, `RPi.GPIO`, `pigpio`
- For your embedded vision QC: OpenCV + your HuskyLens integration

## Security Hardening (when exposed)
```bash
sudo apt install ufw fail2ban
sudo ufw default deny incoming
sudo ufw allow 22/tcp
sudo ufw enable
```

*Last curated: June 2026*