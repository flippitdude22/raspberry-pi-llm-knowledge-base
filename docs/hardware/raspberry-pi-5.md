# Raspberry Pi 5 Hardware Specifications

**Source**: Official Raspberry Pi documentation (https://www.raspberrypi.com/documentation/computers/raspberry-pi.html)

## Overview
Raspberry Pi 5 is the current flagship single-board computer. It delivers 2–3× the CPU performance of Raspberry Pi 4 with a new in-house designed silicon platform.

## Key Specifications

| Feature                  | Details                                      |
|--------------------------|----------------------------------------------|
| **SoC**                  | Broadcom BCM2712                             |
| **CPU**                  | Quad-core 64-bit Arm Cortex-A76 @ 2.4 GHz (with cryptographic extensions) |
| **Caches**               | 512 KB L2 per core + 2 MB shared L3          |
| **GPU**                  | VideoCore VII (OpenGL ES 3.1, Vulkan 1.2/1.3) |
| **RAM**                  | 4 GB or 8 GB LPDDR4X-4267 SDRAM (other densities documented) |
| **Storage**              | microSD (SDR104 high-speed support) + NVMe via PCIe |
| **Networking**           | Gigabit Ethernet (PoE+ capable), 802.11ac Wi-Fi 5 (dual-band), Bluetooth 5.0 + BLE |
| **USB**                  | 2× USB 3.0 (5 Gbps), 2× USB 2.0             |
| **Display**              | 2× micro-HDMI (dual 4Kp60 with HDR)          |
| **Camera / Display**     | Dual 4-lane MIPI CSI/DSI transceivers (two mini 22-pin 0.5 mm FFC connectors) |
| **PCIe**                 | x1 Gen 2.0 (Gen 3 configurable) via FFC connector |
| **GPIO**                 | 40-pin header, 3.3 V logic                   |
| **Special Connectors**   | 4-pin JST-SH PWM fan, RTC battery (J5), power button, UART debug |
| **Power**                | USB-C 5 V. Recommended 5 A (25 W) PSU. Supports USB-PD negotiation |
| **Dimensions**           | Standard Raspberry Pi form factor            |

## Important Notes for Embedded & Cybersecurity Use
- **PCIe / NVMe**: Excellent for fast storage. Enable with `dtparam=pciex1` and appropriate bootloader `BOOT_ORDER`.
- **Power Limits**: USB downstream current is limited (600 mA on 3 A PSU). Use `usb_max_current_enable=1` when needed.
- **RTC**: Battery-backed real-time clock available via connector.
- **Thermal**: Use official fan for sustained high performance. Monitor with `vcgencmd measure_temp`.
- **Bootloader**: EEPROM-based (no `bootcode.bin`). Non-empty `config.txt` required.
- **Kali Linux**: Hardware is fully supported. Use same `config.txt` + device tree overlays as Raspberry Pi OS.

## Schematics & Mechanical
- Mechanical drawings (PDF) and STEP files available on the official hardware page.
- Compliance documents via Raspberry Pi Product Information Portal.

## References
- Official page: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
- Product page: https://www.raspberrypi.com/products/raspberry-pi-5/

*Last curated: June 2026*