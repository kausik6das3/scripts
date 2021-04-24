#!/bin/bash
# To set mirror display.
# Author:Kausik Das.
# Lisence: GNU General Public License v2.
dir=~/Packages/scripts
int=LVDS1
ext1=VGA1
ext2=HDMI1
yes="$dir"/mon.png
no="$dir"/worn.png

setscreen(){
	xrandr --output "$int" --auto --output "$ext1" --same-as "$int" --auto
	notify-send -i $yes "$external Mirrored to $int ."

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

