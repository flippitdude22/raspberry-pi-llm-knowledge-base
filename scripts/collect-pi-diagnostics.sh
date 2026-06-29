#!/usr/bin/env bash
set -euo pipefail

out_dir="${1:-pi-diagnostics-$(date +%Y%m%d-%H%M%S)}"
mkdir -p "$out_dir"

run() {
  local name="$1"
  shift
  {
    echo "### $*"
    "$@" 2>&1 || true
  } > "$out_dir/$name.txt"
}

run os-release cat /etc/os-release
run uname uname -a
run model sh -c 'cat /proc/device-tree/model; echo'
run cpuinfo sh -c "grep -E 'Model|Revision|Serial|Hardware' /proc/cpuinfo"
run lsblk lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS,MODEL
run disk-free df -h
run ip-address ip addr
run ip-route ip route
run nmcli-device nmcli device status
run rfkill rfkill list
run vcgencmd-version vcgencmd version
run vcgencmd-temp vcgencmd measure_temp
run vcgencmd-throttled vcgencmd get_throttled
run eeprom sudo rpi-eeprom-update
run failed-services systemctl --failed
run journal-warnings journalctl -p warning -b --no-pager
run dmesg sudo dmesg -T

if [ -f /boot/firmware/config.txt ]; then
  cp /boot/firmware/config.txt "$out_dir/config.txt"
fi

if [ -f /boot/firmware/cmdline.txt ]; then
  cp /boot/firmware/cmdline.txt "$out_dir/cmdline.txt"
fi

tar -czf "$out_dir.tar.gz" "$out_dir"
echo "Wrote $out_dir.tar.gz"
