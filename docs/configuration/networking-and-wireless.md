# Networking & Wireless Configuration

**Focus**: RaspAP, Pwnagotchi, portable APs, and pentesting use cases on Pi 5 and Zero 2 W.

## Wireless Country
Always set the regulatory domain:
```bash
sudo raspi-config          # Advanced Options > A11 Set Wireless LAN Country
# or
sudo iw reg set US
```

## Wi-Fi Client (Headless)
```bash
nmcli dev wifi connect "YourSSID" password "YourPassword"
```

## Wi-Fi Access Point (RaspAP recommended)
RaspAP provides a clean web UI and reliable hostapd + dnsmasq setup. Highly recommended for your portable private AP projects.

For manual hostapd:
- Install `hostapd` and `dnsmasq`
- Configure `/etc/hostapd/hostapd.conf`
- Use a static IP or DHCP reservation for the AP interface

## Power Saving
Disable WLAN power saving for consistent performance in pentesting / AP roles:
```bash
sudo raspi-config          # Advanced Options > A13 WLAN Power Save
```

## Useful Commands
```bash
nmcli device status
nmcli connection show
iw dev
rfkill list
```

## References
- Official networking section in configuration docs.

*Last curated: June 2026*