#!/bin/bash
# To set primary monitor only.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0.

intern=LVDS1
extern1=VGA1
extern2=HDMI1
xrandr --output "$intern" --auto --output "$extern1" --off --output "$extern2" --off
notify-send "$intern Only."
