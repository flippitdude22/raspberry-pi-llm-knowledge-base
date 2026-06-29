# Boot, Power, Network, and Display Troubleshooting

Sources:

- Raspberry Pi hardware documentation: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
- Configuration documentation: https://www.raspberrypi.com/documentation/computers/configuration.html
- Remote access documentation: https://www.raspberrypi.com/documentation/computers/remote-access.html

## First Questions

Collect:

- Board model and RAM.
- OS image and release.
- Power supply rating and cable.
- Boot media: microSD, USB, NVMe, network.
- Exact LED behavior.
- Whether HDMI shows rainbow screen, bootloader screen, kernel messages, desktop, or no signal.
- Recent edits to `config.txt`, `cmdline.txt`, EEPROM, overlays, or hardware.

## No Boot

Checks:

```bash
# On another Linux computer after mounting boot media:
ls -la /media/$USER/*/
cat /media/$USER/*/config.txt
cat /media/$USER/*/cmdline.txt
```

Actions:

1. Re-image a known-good microSD card with Raspberry Pi Imager.
2. Use official Raspberry Pi OS Lite for baseline testing.
3. Remove HATs, USB devices, cameras, displays, and GPIO wiring.
4. Use the official or known-good power supply.
5. Try HDMI closest to USB-C power on boards with dual micro-HDMI, unless board docs say otherwise.
6. Check EEPROM recovery docs for Pi 4/Pi 5 bootloader issues.

## Undervoltage or Throttling

On a booted system:

```bash
vcgencmd get_throttled
vcgencmd measure_temp
journalctl -b | grep -Ei 'voltage|thrott|thermal|under-voltage'
```

Common fixes:

- Use a proper USB-C supply for Pi 5, preferably 5 V 5 A for heavy USB loads.
- Replace thin or charge-only USB cables.
- Power motors, relays, disks, and radios separately with common ground where required.
- Add active cooling for sustained Pi 5 CPU, NVMe, camera, or AI workloads.

## Network Missing

Checks:

```bash
ip addr
ip route
nmcli device status
rfkill list
iw reg get
iw dev
journalctl -u NetworkManager -b
```

Fixes:

- Set Wi-Fi country/regulatory domain.
- Check SSID/password and 2.4 GHz vs 5 GHz compatibility.
- Disable WLAN power saving for AP, robot, or field devices.
- For headless first boot, re-image with Raspberry Pi Imager advanced settings.
- For `.local` hostname problems, test IP address directly and verify mDNS/Avahi.

## Display Problems

Checks:

```bash
tvservice -s 2>/dev/null || true
wlr-randr 2>/dev/null || true
cat /boot/firmware/config.txt
```

Fixes:

- Use known-good HDMI cable and monitor.
- Verify the correct micro-HDMI port.
- Remove forced legacy HDMI settings unless specifically needed.
- Confirm the OS image supports the board model.
- For touch displays or DSI panels, check connector orientation and model compatibility.

## Camera Not Detected

```bash
rpicam-hello --list-cameras
libcamera-hello --list-cameras 2>/dev/null || true
v4l2-ctl --list-devices
dmesg -T | grep -Ei 'camera|imx|ov|unicam|csi'
```

Fixes:

- Use `rpicam-*` commands on current Raspberry Pi OS.
- Check FFC cable orientation and connector type.
- Verify camera module compatibility with the board connector.
- Remove old legacy camera stack assumptions.

## When to Stop Guessing

Escalate to official docs, forum, or hardware swap when:

- EEPROM recovery fails.
- Known-good image, power supply, and boot media fail.
- `dmesg` shows storage I/O errors repeatedly.
- The board overheats instantly with no load.
- GPIO was exposed to 5 V or shorted.
