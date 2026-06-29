# Raspberry Pi Command Reference

Use these commands as first-pass diagnostics and administration helpers. Commands assume Raspberry Pi OS unless noted.

Sources:

- Raspberry Pi OS documentation: https://www.raspberrypi.com/documentation/computers/os.html
- Configuration documentation: https://www.raspberrypi.com/documentation/computers/configuration.html
- Hardware documentation: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html
- Remote access documentation: https://www.raspberrypi.com/documentation/computers/remote-access.html

## Identify the System

```bash
cat /etc/os-release
uname -a
cat /proc/device-tree/model
cat /proc/cpuinfo | grep -E 'Model|Revision|Serial'
hostnamectl
```

## Update Safely

```bash
sudo apt update
sudo apt full-upgrade
sudo reboot
```

Avoid `rpi-update` unless a Raspberry Pi engineer, release note, or specific bug workaround tells you to use test firmware.

## Raspberry Pi Configuration

```bash
sudo raspi-config
sudo raspi-config nonint get_ssh
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_spi 0
sudo raspi-config nonint do_serial_hw 0
```

On current Raspberry Pi OS images, boot files are normally under:

```bash
ls -la /boot/firmware
sudo nano /boot/firmware/config.txt
sudo nano /boot/firmware/cmdline.txt
```

## Hardware and Firmware

```bash
vcgencmd version
vcgencmd measure_temp
vcgencmd get_throttled
vcgencmd get_config int
vcgencmd get_config str
sudo rpi-eeprom-update
sudo rpi-eeprom-config
```

`vcgencmd get_throttled` returns a bitfield. A non-zero value means the Pi has seen undervoltage, frequency capping, throttling, or temperature limiting since boot.

## GPIO and Interfaces

```bash
pinout
pinctrl
pinctrl get
ls /dev/i2c* /dev/spidev* /dev/serial* 2>/dev/null
sudo i2cdetect -y 1
```

GPIO is 3.3 V logic and is not 5 V tolerant.

## Network

```bash
ip addr
ip route
nmcli device status
nmcli connection show
nmcli dev wifi list
nmcli dev wifi connect "SSID" password "PASSWORD"
rfkill list
iw dev
iw reg get
resolvectl status
```

## SSH and Remote Access

```bash
sudo systemctl status ssh
sudo systemctl enable --now ssh
ssh pi@raspberrypi.local
scp file.txt pi@raspberrypi.local:/home/pi/
rsync -avh ./folder/ pi@raspberrypi.local:/home/pi/folder/
```

For headless setups, prefer Raspberry Pi Imager advanced settings to create user, Wi-Fi, locale, and SSH configuration before first boot.

## Storage

```bash
lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
blkid
df -h
sudo dmesg -T | grep -Ei 'mmc|sd|usb|nvme|ext4|i/o error'
sudo smartctl -a /dev/nvme0n1
```

Install SMART tooling if needed:

```bash
sudo apt install smartmontools
```

## Services and Logs

```bash
systemctl --failed
journalctl -p warning -b
journalctl -u ssh -b
sudo dmesg -T
sudo reboot
sudo shutdown -h now
```

## Camera

```bash
rpicam-hello --list-cameras
rpicam-hello -t 5000
rpicam-still -o test.jpg
rpicam-vid -t 10000 -o test.h264
v4l2-ctl --list-devices
```

## Python Environment

```bash
python3 --version
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip
```

On Bookworm, use virtual environments for Python packages that are not installed from Debian/Raspberry Pi OS packages.
