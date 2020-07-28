#!/bin/bash
# To set mirror display.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.

intern=LVDS1
extern1=VGA1
extern2=HDMI1
if [ ! -z "$(xrandr | grep "$extern1 connected")" ]; then
	xrandr --output "$intern" --auto --output "$extern1" --same-as "$intern" --auto
	notify-send "$intern Mirrored to $extern1 ."
elif [ ! -z "$(xrandr | grep "$extern2 connected")" ]; then
	xrandr --output "$intern" --auto --output "$extern2" --same-as "$intern" --auto
	notify-send "$intern Mirrored to $extern2 ."
else
	notify-send "ERROR: No External Monitor Detected."
fi &

