#!/bin/bash

STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.enable"
DEVICE_NAME=elan1200:00-04f3:30ef-touchpad

function toggle_touchpad() {
	if [ -f $STATUS_FILE ]
	then
		rm $STATUS_FILE
	else
		touch $STATUS_FILE
	fi
}

function get_status() {
	if [ -f $STATUS_FILE ]
	then 
		echo 1
	else
		echo 0
	fi
}

if [[ $1 == "toggle" ]]
then
	toggle_touchpad
fi

status=$(get_status)
hyprctl keyword -r -- "device[$DEVICE_NAME]:enabled" "$status"
