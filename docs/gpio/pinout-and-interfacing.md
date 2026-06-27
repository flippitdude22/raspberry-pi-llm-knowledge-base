# GPIO and the 40-Pin Header

**Source**: Official Raspberry Pi documentation (gpio-on-raspberry-pi.adoc)

All current Raspberry Pi boards (including Pi 5 and Zero 2 W) use the same 40-pin GPIO header with 0.1" (2.54 mm) pitch.

**Note**: On standard Raspberry Pi Zero 2 W the header is unpopulated. Solder headers or use compatible solutions.

## Power Pins (Fixed)
- **3.3 V**: Physical pins 1, 17 (logic level only — limited current)
- **5 V**: Physical pins 2, 4 (direct from PSU — higher current available)
- **GND**: Pins 6, 9, 14, 20, 25, 30, 34, 39

## Key Alternate Functions (BCM Numbering)

| Function       | BCM GPIO Pins                  | Notes                                      |
|----------------|--------------------------------|--------------------------------------------|
| I²C (primary) | 2 (SDA), 3 (SCL)              | Fixed pull-ups on these pins               |
| UART0          | 14 (TX), 15 (RX)               | Primary console on many setups             |
| SPI0           | 9 (MISO), 10 (MOSI), 11 (SCLK), 8 & 7 (CE) | Primary SPI bus                            |
| PWM (hardware) | 12, 13, 18, 19                 | Two independent channels                   |
| 1-Wire         | 4                              | Common choice                              |

## Viewing Live Pinout
On any Raspberry Pi run:
```bash
pinout          # From gpiozero (installed by default on Raspberry Pi OS)
pinctrl         # Modern command for pin control
```

## Best Practices for Embedded Projects
- Use hardware PWM / I²C / SPI where possible for performance and accuracy.
- Always add current-limiting resistors for LEDs.
- Use level shifters when interfacing 5 V logic.
- For your vision QC / reject kicker projects: Prefer dedicated PWM or I²C pins for servos and sensors.
- Pi 5 uses RP1 southbridge GPIOs with richer alternate functions.

## References
- Official GPIO section: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#gpio-and-the-40-pin-header
- Run `pinout` on your device for the authoritative interactive reference.

*Last curated: June 2026*