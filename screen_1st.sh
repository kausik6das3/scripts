#!/bin/bash
# To set primary monitor only.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.

int=LVDS1
ext1=VGA1
ext2=HDMI1
yes=~/Linux_packages/scripts/mon.png
no=~/Linux_packages/scripts/worn.png

setscreen(){
	xrandr --output "$int" --auto --output "$ext1" --off --output "$ext2" --off
	notify-send -i $yes "$int Only."
}

setscreen
