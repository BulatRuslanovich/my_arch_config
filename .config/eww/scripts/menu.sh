#!/bin/bash

names=(
  "Firefox"
  "VsCode"
  "Yandex Music"
  "VPN"
)

execs=(
  "firefox"
  "code"
  "yandex-music"
  "~/.config/eww/scripts/adguard-toggle.sh"
)

icons=(
  "/usr/share/icons/Papirus-Dark/128x128/apps/firefox.svg"
  "/usr/share/icons/Papirus-Dark/128x128/apps/vscode.svg"
  "/usr/share/icons/Papirus-Dark/128x128/apps/yandex-music.svg"
  "/usr/share/icons/Papirus-Dark/128x128/devices/network-vpn.svg"
)

terminal=(
  false
  false
  false
  true
)

json="["

for i in "${!names[@]}"; do
  [[ $i -ne 0 ]] && json+=","
  json+="{\"name\":\"${names[$i]}\",\"exec\":\"${execs[$i]}\",\"icon\":\"${icons[$i]}\",\"terminal\":\"${terminal[$i]}\"}"
done

json+="]"
echo "$json"