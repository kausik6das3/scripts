#!/bin/bash
# To set seondory monitor extended left of primary monitor.
# Author:Kausik Das.
# Lisence: GNU General Public License v2.
dir=~/Packages/scripts
int=LVDS1
ext1=VGA1
ext2=HDMI1
yes="$dir"/mon.png
no="$dir"/worn.png

setscreen(){
	xrandr --output "$int" --auto --output "$external" --left-of "$int" --primary --auto
	notify-send -i $yes "Set $external Left of $int ."
}

if [ ! -z "$(xrandr | grep "$ext1 connected")" ]; then
	external="$ext1"
	setscreen
elif [ ! -z "$(xrandr | grep "$ext2 connected")" ]; then
	external="$ext2"
	setscreen
else
	notify-send -i $no "EROOR: No External Monitor Detected ."
fi &

