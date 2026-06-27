# Raspberry Pi Zero 2 W Hardware Specifications

**Source**: Official Raspberry Pi documentation

## Overview
The Raspberry Pi Zero 2 W is the high-performance successor to the original Zero W. It packs a quad-core 64-bit processor into the same tiny form factor, making it ideal for portable, battery-powered, and embedded projects.

## Key Specifications

| Feature                  | Details                                           |
|--------------------------|---------------------------------------------------|
| **SoC**                  | RP3A0 (Broadcom BCM2710A1-based)                  |
| **CPU**                  | Quad-core 64-bit Arm Cortex-A53 @ 1 GHz           |
| **GPU**                  | VideoCore IV                                      |
| **RAM**                  | 512 MB LPDDR2 SDRAM                               |
| **Storage**              | microSD (bootable) + USB mass storage boot        |
| **Networking**           | 2.4 GHz 802.11 b/g/n Wi-Fi, Bluetooth 4.2 + BLE (onboard antenna) |
| **USB**                  | 1× micro-USB OTG (data + power)                  |
| **Display**              | Mini HDMI (up to 1080p)                           |
| **Camera**               | CSI-2 connector (mini 22-pin 0.5 mm FFC)          |
| **GPIO**                 | 40-pin header footprint (unpopulated on standard models) |
| **Power**                | 5 V via micro-USB. Very low consumption — ideal for battery/portable use |
| **Dimensions**           | 65 mm × 30 mm form factor                        |

## Important Notes for Portable & Pentesting Projects
- **Perfect for**: RaspAP private Wi-Fi AP, Pwnagotchi, portable pentesting devices, battery-powered vision systems (HuskyLens + PiSugar 3).
- **GPIO**: Header is unpopulated by default. Solder headers or use pogo-pin / hammer-header solutions.
- **Wireless**: Single-band 2.4 GHz only. Onboard antenna.
- **Power Efficiency**: Excellent for long battery life. Combine with PiSugar 3 for portable AP / pentest rigs.
- **No Ethernet / PoE**: Use USB Ethernet adapter or Wi-Fi only.
- **Kali Linux**: Fully compatible. Great platform for wireless security tools.

## Test Pads
Production/debug test pads are available (STATUS_LED, CORE, RUN, 5V, GND, USB_DP/DM, etc.). See official mechanical drawings for coordinates.

## References
- Official page: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
- Product page: https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/

*Last curated: June 2026*