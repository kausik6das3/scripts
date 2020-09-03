#!/bin/bash
# To set secondery monitor only.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.
dir=~/Packages/scripts
int=LVDS1
ext1=VGA1
ext2=HDMI1
yes="$dir"/mon.png
no="$dir"/worn.png

setscreen(){
	xrandr --output "$int" --off --output "$external" --auto
	notify-send -i $yes "$external Only."
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

