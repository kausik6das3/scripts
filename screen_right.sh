#!/bin/bash
# To set secoundary monitor extended right to primary nonitor.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.

intern=LVDS1
extern1=VGA1
extern2=HDMI1
if [ ! -z "$(xrandr | grep "$extern1 connected")" ]; then
	xrandr --output "$intern" --auto --output "$extern1" --auto --right-of "$intern"
	notify-send "Set $extern1 right of $intern ."
elif [ ! -z "$(xrandr | grep "$extern2 connected")" ]; then
	xrandr ---output "$intern" --auto --output "$extern2" --auto --right-of "$intern" 
	notify-send "Set $extern2 right of $intern ."
else
	notify-send "ERROR: No External Monitor Detected."
fi &

