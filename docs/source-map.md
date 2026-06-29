# Source Map

Use this file to decide where to verify Raspberry Pi facts.

## Official Raspberry Pi Sources

- Main computer documentation: https://www.raspberrypi.com/documentation/computers/
- Configuration: https://www.raspberrypi.com/documentation/computers/configuration.html
- Raspberry Pi OS: https://www.raspberrypi.com/documentation/computers/os.html
- Remote access: https://www.raspberrypi.com/documentation/computers/remote-access.html
- Computer hardware: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
- Camera software: https://www.raspberrypi.com/documentation/computers/camera_software.html
- AI software: https://www.raspberrypi.com/documentation/computers/ai.html
- Processor docs: https://www.raspberrypi.com/documentation/computers/processors.html
- M.2 HAT+: https://www.raspberrypi.com/documentation/accessories/m2-hat-plus.html
- Documentation source repository: https://github.com/raspberrypi/documentation

## Use Official Sources For

- Board specifications.
- Pin mappings and GPIO electrical limits.
- Bootloader and EEPROM behavior.
- `config.txt`, overlays, and `cmdline.txt`.
- Camera stack commands and supported workflows.
- PCIe, NVMe, USB boot, and power behavior.
- Raspberry Pi OS utilities and release-specific behavior.

## Use Debian/Linux Sources For

- `systemd`, services, timers, and journald.
- `apt`, package management, and service layout.
- OpenSSH behavior.
- NetworkManager concepts.
- Filesystem and storage diagnostics.

## Use Project or Vendor Sources For

- Third-party HATs, displays, batteries, and sensors.
- Kali Linux images and tool packages.
- Pwnagotchi/RaspAP-specific configuration.
- USB accelerators, Hailo model packages, and camera accessories.

If sources disagree, prefer current official Raspberry Pi docs for Raspberry Pi hardware and firmware behavior.
