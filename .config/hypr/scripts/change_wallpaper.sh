#!/bin/bash


WALLPAPER_DIR="$HOME/img/main"
CURRENT_WALLPAPER_LINK="$HOME/.config/hypr/current_wallpaper"


WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

swww img "$WALLPAPER" --transition-type wipe --transition-duration 2

echo $WALLPAPER
# Проверка и удаление недействительной символьной ссылки
if [ -L "$CURRENT_WALLPAPER_LINK" ] && [ ! -e "$CURRENT_WALLPAPER_LINK" ]; then
    echo "Символьная ссылка $CURRENT_WALLPAPER_LINK недействительна, удаляю..."
    rm "$CURRENT_WALLPAPER_LINK"
fi

ln -sf "$WALLPAPER" "$CURRENT_WALLPAPER_LINK"