#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

function change_wallpaper() {
	CURRENT_WALL=$(hyprctl hyprpaper listloaded)
        MONITORS=$(hyprctl monitors -j | jq -r ".[] | .name") 
	
        for monitor in $MONITORS; do
		WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

		hyprctl hyprpaper reload "$monitor","$WALLPAPER"
	done
}

until hyprctl hyprpaper listloaded
do
	sleep 1s
done

while true
do
	change_wallpaper
	sleep 10m
done

