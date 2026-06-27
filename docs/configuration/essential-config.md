# Essential Configuration (config.txt, Bootloader, Device Tree)

**Source**: Official configuration documentation

## Location of Key Files
- `/boot/firmware/config.txt` (primary on Pi 5 and modern images)
- `/boot/firmware/cmdline.txt`
- `/boot/firmware/overlays/` (device tree overlays)

**Important**: On Raspberry Pi 5 the `config.txt` file **must not be empty**.

## Recommended Base Configuration (Headless + Reliable)

```txt
# Core
arm_64bit=1
disable_splash=1
boot_delay=0

# Power & USB (Pi 5)
usb_max_current_enable=1

# PCIe (Pi 5 NVMe storage)
dtparam=pciex1

# Camera / Vision (HuskyLens, production QC)
dtoverlay=ov5647          # Adjust for your camera module
dtparam=camera=on

# RTC (Pi 5)
dtoverlay=i2c-rtc,ds3231

# Fan (Pi 5)
dtoverlay=gpio-fan,gpiopin=18

# Disable Bluetooth if using UART0 exclusively
dtoverlay=disable-bt

# UART reliability (embedded)
enable_uart=1
core_freq=250
```

## Bootloader Notes (Pi 5)
- Uses EEPROM bootloader (no `bootcode.bin`).
- Update with `rpi-eeprom-update`.
- Control boot order via bootloader configuration (see official docs for `BOOT_ORDER` and `PCIE_PROBE`).

## Device Tree Overlays
List active overlays:
```bash
sudo dtoverlay -l
```

Add/remove at runtime (where supported):
```bash
sudo dtoverlay <overlay> [param=value]
sudo dtoverlay -r <overlay>
```

## For Kali Linux
`raspi-config` may be limited. Edit `config.txt` and `cmdline.txt` directly. The hardware parameters above remain valid.

## References
- Official configuration page: https://www.raspberrypi.com/documentation/computers/configuration.html

*Last curated: June 2026*