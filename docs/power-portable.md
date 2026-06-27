# Power Management & Portable Setups

**Focus**: Pi Zero 2 W + PiSugar 3, battery-powered projects, production-line reliability.

## Key Principles
- Monitor voltage and temperature: `vcgencmd measure_volts` and `vcgencmd measure_temp`
- Use high-quality power supplies and cables.
- For portable AP / pentest rigs: Budget current carefully (Zero 2 W is very efficient).
- Consider overlay filesystem or read-only rootfs + tmpfs for SD card longevity in 24/7 production use.

## Pi 5 Power Notes
- Recommended 5 A (25 W) USB-C PSU for full performance + peripherals.
- USB downstream current limited on 3 A supplies — enable higher limit when needed.
- Official fan recommended for sustained loads.

## Pi Zero 2 W + PiSugar 3
- Excellent combination for portable private Wi-Fi AP and Pwnagotchi-style devices.
- Use GPIO power monitoring and safe shutdown scripts.
- Low idle consumption makes long battery life realistic.

## Reliability Tips for Embedded / Production
- Use `nofail` and `x-systemd.device-timeout` in `/etc/fstab` for external storage.
- Enable overlay filesystem via `raspi-config` (Performance options).
- Regular `apt` updates and security hardening (UFW + Fail2Ban for exposed services).

*Last curated: June 2026*