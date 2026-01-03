#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

function change_wallpaper() {
        MONITORS=$(hyprctl monitors -j | jq -r ".[] | .name") 
	
        for monitor in $MONITORS; do
		WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

		hyprctl hyprpaper wallpaper "$monitor","$WALLPAPER",cover
	done
}

sleep 10s

while true
do
	change_wallpaper
	sleep 10m
done

