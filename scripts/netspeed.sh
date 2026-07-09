#!/bin/bash

# network interface (usually wlan0 or wlp* for WiFi)
IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')

if [ -z "$IFACE" ]; then
  echo "down -- B/s | up -- B/s"
  exit 0
fi

# read first sample
read RX1 TX1 < <(awk -v iface="$IFACE" '$1 ~ iface":" {print $2, $10}' /proc/net/dev)
sleep 1
# read second sample
read RX2 TX2 < <(awk -v iface="$IFACE" '$1 ~ iface":" {print $2, $10}' /proc/net/dev)

RX=$((RX2 - RX1))
TX=$((TX2 - TX1))

format() {
  local val=$1
  if [ $val -ge 1048576 ]; then
    echo "$(awk "BEGIN {printf \"%.1f\", $val/1048576}") MB/s"
  elif [ $val -ge 1024 ]; then
    echo "$(awk "BEGIN {printf \"%.0f\", $val/1024}") KB/s"
  else
    echo "${val} B/s"
  fi
}

echo "↓$(format $RX | sed 's/ //g') ↑$(format $TX | sed 's/ //g')"
