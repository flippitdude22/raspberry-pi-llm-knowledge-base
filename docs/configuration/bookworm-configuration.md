# Raspberry Pi OS Bookworm Configuration

Sources:

- Raspberry Pi OS documentation: https://www.raspberrypi.com/documentation/computers/os.html
- Configuration documentation: https://www.raspberrypi.com/documentation/computers/configuration.html
- Remote access documentation: https://www.raspberrypi.com/documentation/computers/remote-access.html

## Current Defaults to Remember

- Raspberry Pi OS Bookworm uses `/boot/firmware/config.txt` and `/boot/firmware/cmdline.txt`.
- NetworkManager is the standard network configuration path on current Raspberry Pi OS.
- `raspi-config` remains the preferred interactive configuration tool for common settings.
- Python package installation should respect Debian's externally managed Python environment. Use `apt`, `pipx`, or `venv` depending on use case.

## First Boot Checklist

Use Raspberry Pi Imager advanced settings when possible:

- Set hostname.
- Create a user and password.
- Configure Wi-Fi SSID, password, country, timezone, and keyboard layout.
- Enable SSH with password or public key authentication.

After first boot:

```bash
sudo apt update
sudo apt full-upgrade
sudo raspi-config
sudo reboot
```

## Important Files

```text
/boot/firmware/config.txt      Firmware and device-tree settings
/boot/firmware/cmdline.txt     Kernel command line, one line only
/boot/firmware/overlays/       Device tree overlays
/etc/os-release                OS identity
/etc/NetworkManager/           NetworkManager config
/etc/systemd/system/           Custom system services
```

## Common `config.txt` Patterns

Enable interfaces:

```ini
dtparam=i2c_arm=on
dtparam=spi=on
enable_uart=1
```

Raspberry Pi 5 PCIe:

```ini
dtparam=pciex1
```

Raspberry Pi 5 higher downstream USB current when using a capable 5 V 5 A supply:

```ini
usb_max_current_enable=1
```

Disable Bluetooth when a project needs the primary UART and Bluetooth is not required:

```ini
dtoverlay=disable-bt
```

Do not copy overlays blindly. Confirm the overlay exists:

```bash
ls /boot/firmware/overlays | grep -i name
dtoverlay -h overlay-name
```

## NetworkManager Examples

List devices and connections:

```bash
nmcli device status
nmcli connection show
```

Connect Wi-Fi:

```bash
nmcli dev wifi list
sudo nmcli dev wifi connect "SSID" password "PASSWORD"
```

Set static IPv4 on a connection:

```bash
sudo nmcli con mod "CONNECTION" ipv4.addresses 192.168.1.50/24
sudo nmcli con mod "CONNECTION" ipv4.gateway 192.168.1.1
sudo nmcli con mod "CONNECTION" ipv4.dns "1.1.1.1 8.8.8.8"
sudo nmcli con mod "CONNECTION" ipv4.method manual
sudo nmcli con up "CONNECTION"
```

## Services

Create long-running project services with systemd instead of `rc.local`.

```bash
sudo systemctl enable --now ssh
systemctl --failed
journalctl -u your-service -b
```

## Good LLM Behavior

When answering configuration questions, ask for:

- Pi model.
- Raspberry Pi OS version or other distro.
- Whether desktop or Lite image is installed.
- Whether the user is editing an offline boot partition or live system.
- Whether a setting must survive reboot.
