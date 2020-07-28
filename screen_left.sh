#!/bin/bash
# To set seondory monitor extended left of primary monitor.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.

intern=LVDS1
extern1=VGA1
extern2=HDMI1
if [ ! -z "$(xrandr | grep "$extern1 connected")" ]; then
	xrandr --output "$intern" --auto --output "$extern1" --auto --left-of "$intern"
	notify-send "Set $extern1 Left of $intern ."
elif [ ! -z "$(xrandr | grep "$extern2 connected")" ]; then
	xrandr ---output "$intern" --auto --output "$extern2" --auto --left-of "$intern" 
	notify-send "Set $extern2 Left of $intern ."
else
	echo EROOR: No External Monitor Detected.
fi &

