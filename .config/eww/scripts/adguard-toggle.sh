#!/bin/bash

# Проверяем текущий статус AdGuard VPN
if eww get adguard-status | grep -q "true"; then
    # Если VPN включен - выключаем
    adguardvpn-cli disconnect
    eww update adguard-status=false
    notify-send "AdGuard VPN" "VPN отключен" -t 2000
else
    # Если VPN выключен - включаем
    adguardvpn-cli connect -l LV
    eww update adguard-status=true
    notify-send "AdGuard VPN" "VPN подключен (LV)" -t 2000
fi