# Boot Media, USB, and NVMe

Sources:

- Raspberry Pi hardware documentation: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
- M.2 HAT+ documentation: https://www.raspberrypi.com/documentation/accessories/m2-hat-plus.html
- Configuration documentation: https://www.raspberrypi.com/documentation/computers/configuration.html

## Storage Choices

- microSD: easiest and most compatible; quality varies heavily.
- USB SSD: good for Pi 4 and Pi 5, but depends on bridge chipset and power.
- NVMe SSD: best Pi 5 performance path through PCIe, commonly with M.2 HAT+ or compatible adapter.
- Network boot: useful for fleets and labs, but more complex.

## Pi 5 PCIe/NVMe Basics

Enable the external PCIe connector in `/boot/firmware/config.txt`:

```ini
dtparam=pciex1
```

Some setups can use PCIe Gen 3, but stability depends on cable, adapter, SSD, power, and firmware:

```ini
dtparam=pciex1_gen=3
```

Use Gen 2 as the baseline when troubleshooting.

## Check NVMe

```bash
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
lspci
sudo dmesg -T | grep -Ei 'pcie|nvme|v3d|rp1'
```

Install tools if needed:

```bash
sudo apt install pciutils nvme-cli smartmontools
sudo nvme list
sudo smartctl -a /dev/nvme0n1
```

## Bootloader and EEPROM

```bash
sudo rpi-eeprom-update
sudo rpi-eeprom-config
sudo rpi-eeprom-config --edit
```

Use official bootloader documentation before changing `BOOT_ORDER`. Keep a known-good microSD card available for recovery.

## Migration Pattern

1. Boot from a known-good microSD.
2. Update OS and EEPROM.
3. Enable PCIe if using Pi 5 NVMe.
4. Confirm the target disk appears in `lsblk`.
5. Use Raspberry Pi Imager or SD Card Copier to write/copy the OS.
6. Boot from the target media.
7. Verify root filesystem:

```bash
findmnt /
lsblk -f
```

## Troubleshooting

- Random freezes under disk load often mean power, cable, thermal, or bridge-chip instability.
- USB disks may need powered hubs.
- NVMe drives can brown out or overheat under sustained writes.
- If Gen 3 fails, revert to Gen 2.
- If boot fails, test the same image on microSD before blaming the SSD.
