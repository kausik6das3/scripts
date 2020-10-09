#!/bin/bash
# To set primary monitor only.
# Author:Kausik Das.
# Lisence: GNU General Public License v2.
dir=~/Packages
int=LVDS1
ext1=VGA1
ext2=HDMI1
yes="$dir"/scripts/mon.png
no="$dir"/scripts/worn.png

setscreen(){
	xrandr --output "$int" --primary --auto --output "$ext1" --off --output "$ext2" --off
	notify-send -i $yes "$int Only."
}

setscreen
