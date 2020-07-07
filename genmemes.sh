#!/bin/bash
# Name: Meme Generator
# Version: 0.2
# Author: Cesar Villegas Ureta - https//www.slayerx.org/
# GitHub repo: https://github.com/cvillegas/bash 
# License: MIT License
# Description: Use convert to put text in any image 

trap ctrl_c INT

function ctrl_c() {
        echo -e "\n CTRL-C detected ** Program finished **"
        exit 1
}
echo "checking convert" 

FILE=/usr/bin/convert
if [[ -f $FILE  ]]
then
    echo "Using convert"
else 
    echo "Please install ImageMagick before using this script" 
    exit 127  
fi 

current_time=$(date "+%Y.%m.%d-%H.%M.%S")


read -p -r "Original file: " img_orig
read -p -rn 18 "Text for the top (max 18 chars): " text_top
read -p -rn 18 "Text for bottom (max 18 chars): " text_bottom
read -p -r "Name for the image: " img_final


if [[ -f $img_orig  ]]
then
    SIZE=$(identify -format "%wx%h" "$img_orig")
    echo "archivo encontrado $SIZE"
else 
    echo "$img_orig File not found or file cannot be readed" 
    exit 127
fi


echo "Programa continua con $img_orig y los textos $text_top y $text_bottom" 
#
FONT=Paladino-Bold 
COLORFILL=white
PSIZE=84

# # Make your own meme image using Imagemagick.
convert "$img_orig" -font "$FONT" -fill "$COLORFILL" -pointsize "$PSIZE" -stroke black -strokewidth 3 -gravity north -annotate +0+60 "$text_top" -gravity south  -annotate +0+20 "$text_bottom" "$img_final"



