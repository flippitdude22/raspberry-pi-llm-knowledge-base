# Board Selection and Capabilities

Sources:

- Raspberry Pi hardware documentation: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
- Processor documentation: https://www.raspberrypi.com/documentation/computers/processors.html
- Raspberry Pi product pages: https://www.raspberrypi.com/products/

## Quick Selection

| Need | Strong Choice | Notes |
| --- | --- | --- |
| Desktop, AI, camera, NVMe, servers | Raspberry Pi 5 | Best performance and PCIe; plan cooling and power. |
| Low-cost Linux node with Wi-Fi | Raspberry Pi Zero 2 W | Small and efficient; limited RAM and I/O. |
| Mature general projects | Raspberry Pi 4 | Strong ecosystem; USB boot support; no Pi 5 PCIe FFC. |
| Industrial carrier board design | Compute Module family | Choose CM4/CM5 based on I/O, availability, and carrier needs. |
| Microcontroller timing, PIO, USB device projects | Raspberry Pi Pico / Pico 2 | Not Linux; use MicroPython or Pico SDK. |

## Raspberry Pi 5 Highlights

- Broadcom BCM2712 application processor.
- RP1 I/O controller.
- Dual micro-HDMI display output.
- 40-pin GPIO header with 3.3 V logic.
- External PCIe x1 connector for M.2/NVMe adapters.
- Dedicated fan connector and RTC battery connector.
- Needs better power and thermal planning than smaller boards.

## Raspberry Pi Zero 2 W Highlights

- Small Linux-capable board.
- Built-in wireless.
- Useful for portable sensors, lightweight agents, USB gadget workflows, and compact network tools.
- Limited by RAM, connector access, and single-board thermal/power constraints.

## Capability Questions an Agent Should Ask

- Is this a Linux project or a microcontroller project?
- Does the user need camera, display, Wi-Fi, Ethernet, GPIO, PCIe, or USB gadget mode?
- Is the Pi battery powered?
- Is sustained CPU/GPU/AI/storage load expected?
- Are real-time signals required? If yes, consider Pico, external MCU, kernel drivers, or hardware peripherals.

## Common Wrong Assumptions

- GPIO pins are not 5 V tolerant.
- Physical pin numbers and BCM GPIO numbers are different.
- Pi 5 PCIe does not mean every NVMe adapter and SSD is stable at every speed.
- Camera commands changed from old legacy tools to `rpicam-*` on current Raspberry Pi OS.
- Raspberry Pi OS networking behavior differs across releases; Bookworm uses NetworkManager by default.
