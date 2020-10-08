#!/bin/bash
# To set secoundary monitor extended right to primary nonitor.
# Author:Kausik Das.
# Lisence: GNU General Public License v2.
dir=~/Packages/scripts
int=LVDS1
ext1=VGA1
ext2=HDMI1
yes="$dir"/mon.png
no="$dir"/worn.png

setscreen(){
	xrandr --output "$int" --primary --auto --output "$external" --right-of "$int" --auto
	notify-send -i $yes "Set $external right of $int ."
}

if [ ! -z "$(xrandr | grep "$ext1 connected")" ]; then
	external="$ext1"
	setscreen
elif [ ! -z "$(xrandr | grep "$ext2 connected")" ]; then
	external="$ext2"
	setscreen
else
	notify-send -i $no "ERROR: No External Monitor Detected."
fi &

