#!/bin/bash

# Проверяем статус AdGuard VPN
if adguardvpn-cli status | grep -q "Connected"; then
    eww update adguard-status=true
else
    eww update adguard-status=false
fi