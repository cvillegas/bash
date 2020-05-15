#!/bin/bash 
# Name: tput_examples.sh 
# Version: 0.01
# Author: Cesar Villegas Ureta - https//www.slayerx.org/
# GitHub repo: https://github.com/cvillegas/bash 
# License: MIT License
# Description: This script will show you examples of the tput usage 

function pause(){
   read -p "$*"
}

function blue_white(){
    tput setab 4
    tput setaf 3
}


blue_white
echo "tput examples"
echo "=============" 
echo ""

echo "1.- Total number of lines and colums use: #tput lines and #tput cols"
tput sgr0
echo ""
echo "Colums:"; tput cols 
echo "Lines:"; tput lines
echo ""
pause "Press Enter to continue..."
tput clear 

blue_white
echo "2.- If you want to use the red color use: #tput setaf 1"
tput setaf 1
tput setab 0
echo ""
echo "this is red" 
tput sgr0
echo ""

blue_white
echo "3.- Change the background color use: #tput setab 2"
tput sgr0
tput setab 2
echo ""
echo "changing background"
tput setab 0 
echo ""

echo "List of basic colors"
for i in `seq 0 7`; do tput setaf $i; echo "This is color $i"; done
pause "Press Enter to continue..."
echo ""

echo "List of background colors"
for i in `seq 0 7`; do tput setab $i; echo "This is background color $i"; done
tput setaf 7
tput setab 0
pause "Press Enter key to continue..."

tput clear 
blue_white
echo "4.- If you need to clear the screen you can use: # tput clear" 
tput sgr0
pause "Press Enter to clear the screen and continue..."
tput clear 

blue_white
echo "5.- Move the cursor to a specific position #tput cup 'x' and 'y'  replace 'x' and 'y' for the desired values" 
echo "in this example let's move the cursor to the position 15 10 and print the X letter"
tput sgr0
tput cup 5 10 
tput setab 5
echo "X"
tput sgr0
echo ""


blue_white
echo "6.- Put text in bold with # tput bold " 
tput sgr0
echo ""
echo "this is bold " 
echo ""

blue_white
echo "7.- Put text in underline mode with # tput smul"
tput sgr0
echo ""
tput smul 
echo "underlined text"
tput rmul
echo ""
echo "Back to normal using #tput rmul"
echo "normal text"
echo ""

blue_white
echo "8.- Hide the cursor with # tput civis"
tput sgr0
tput civis 
echo ""
pause "There is no cursor!!! Press Enter to continue..."
echo ""

blue_white
echo "9.- Return the cursor with # tput cnorm"
tput sgr0
tput cnorm 
echo ""
pause "Cursor is back !!! Press Enter to continue..."
echo ""

blue_white
echo "10.- If anything goes wrong or you just want to reset the console use # tput reset" 
tput sgr0
echo ""
pause "Press Enter to clear the screen, reset the console and finish this script"
tput reset 