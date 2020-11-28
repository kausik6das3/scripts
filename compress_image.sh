#!/bin/bash
# To compress an image
# Author Kausik Das
# Lisence: GNU General Public Licence V2
# $bash ./compress.sh input.ext output.ext 85
convert $1 \
-sampling-factor 4:2:0 \
-strip \
-quality $3 \
-interlace Plane \
-gaussian-blur 0.05 \
-colorspace RGB \
$2
