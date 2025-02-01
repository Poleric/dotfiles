#!/bin/bash

wallpaper_directory=$HOME/Pictures/wallpapers/
wallpaper_path=$(find "$wallpaper_directory" -type f | shuf -n 1)

swaymsg output * bg "$wallpaper_path" fill
