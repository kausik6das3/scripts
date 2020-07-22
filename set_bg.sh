#!/bin/bash
# To set walpaper.
# Author:Kausik Das.
# Lisence: GNU General Public License v3.0
#  
INPUT1=$1
BG_LOC=/home/kausik/.local/share/bg

set_wallpaper(){
#use "" for handeling space (test\ file.jpg) in argument
	FILENAME=$(basename -- "$1")
	EXTENSION="${FILENAME##*.}"
	FILENAME="${FILENAME%.*}"
		if [ "$EXTENSION" == "png" ] || [ "$EXTENSION" == "jpg" ]; then
			cp "$1" $BG_LOC
			xwallpaper --stretch $BG_LOC && notify-send -i $BG_LOC "Walpaper changed to" "$WALL"&
		else 
			echo "$1" is not an suported image file.
		fi 
			
}

manage(){
#	echo "$1"
	if test -z "$1"; then
		echo ERROR: empty argument.

	elif test -d "$1"; then
		WALL="$1"
		WALL="$WALL""/$(ls "$1"|shuf -n1)"
#		echo "$WALL"
			if test -z "$(ls "$1")"; then
				echo ERROR: "$1" is empty.

			elif test -d "$WALL"; then
#				echo 1 "$WALL"
				manage "$WALL"
			elif test -f "$WALL"; then
				set_wallpaper "$WALL"

			else
				echo ERROR: "$WALL"			
			fi

	elif test -f "$1"; then
		set_wallpaper "$1"
	
	else
		echo ERROR: "$1" is not a good argument.	
	
	fi
	
	

}

manage "$INPUT1"

