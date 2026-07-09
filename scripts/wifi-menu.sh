#!/bin/bash

# list available wifi networks
CHOICE=$(nmcli -f SSID,SECURITY,SIGNAL device wifi list | tail -n +2 | \
  wofi -dmenu -p "WiFi" -i -l 10)

if [ -n "$CHOICE" ]; then
  SSID=$(echo "$CHOICE" | awk '{$1=$1; print $1}')
  # check if secured
  if echo "$CHOICE" | grep -q "WPA\|WEP\|802.1X"; then
    PASSWORD=$(wofi -dmenu -p "Password for $SSID" -password)
    nmcli device wifi connect "$SSID" password "$PASSWORD" 2>/dev/null || \
      nmcli device wifi connect "$SSID" 2>/dev/null
  else
    nmcli device wifi connect "$SSID" 2>/dev/null
  fi
fi
