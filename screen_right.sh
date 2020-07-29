#!/bin/bash
# To set secoundary monitor extended right to primary nonitor.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.

int=LVDS1
ext1=VGA1
ext2=HDMI1
yes=~/Linux_packages/scripts/mon.png
no=~/Linux_packages/scripts/worn.png

setscreen(){
	xrandr --output "$int" --auto --output "$external" --auto --right-of "$int"
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

