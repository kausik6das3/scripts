#!/bin/bash
# To set secondery monitor only.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.

intern=LVDS1
extern1=VGA1
extern2=HDMI1
if [ ! -z "$(xrandr | grep "$extern1 connected")" ]; then
	xrandr --output "$intern" --off --output "$extern1" --auto
	notify-send "$extern1 Only ."

elif [ ! -z "$(xrandr | grep "$extern2 connected")" ]; then
	xrandr --output "$intern" --off --output "$extern2" --auto
	notify-send "$extern2 Only ."
else
	notify-send "ERROR: No External Monitor Detected."
fi &

