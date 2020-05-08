#!/bin/bash 
# Author: Cesar Villegas Ureta - https//www.slayerx.org/
# This script will show you some simple examples of the tput usage 

function pause(){
   read -p "$*"
}

echo "tput examples"
echo "=============" 
echo ""

echo "Total number of lines and colums use: #tput lines and #tput cols"
echo "Colums:"; tput cols 
echo "Lines:"; tput lines
echo ""
pause "Press Enter to continue..."
tput clear 

echo "If you want to use the red color use: #tput setaf 1"
tput setaf 1
echo "this is red" 
tput setaf 7
echo ""

echo "Change the background color use: #tput setab 2"
tput setab 2
echo "changing background"
tput setab 0 
echo ""

echo "List of basic colors"
for i in `seq 0 7`; do tput setaf $i; echo "This is color $i"; done
pause "Press Enter to continue..."

echo "List of background colors"
for i in `seq 0 7`; do tput setab $i; echo "This is background color $i"; done
tput setaf 7
tput setab 0


pause "Press Enter key to continue..."

echo "If you need to clear the screen you can use: # tput clear" 
pause "Press Enter to clear the screen and continue..."
tput clear 


echo "Move the cursor to a specific position #tput cup x y  replace x and y for the desired values" 
echo "in this example I am going to move the cursor to the position 15 10 and print an X"
tput cup 15 10 
echo "X"



echo "Put text in bold with # tput bold " 
echo "this is bold " 
echo ""

echo "Put text in underline mode with # tput smul"
tput smul 
echo "underlined text"
tput rmul
echo "Back to normal using #tput rmul"
echo "normal text"
echo ""

echo "Hide the cursor with # tput civis"
tput civis 
pause "There is no cursor!!! Press Enter to continue..."

echo "Return the cursor with # tput cnorm"
tput cnorm 
pause "Cursor is back !!! Press Enter to continue..."

echo "If anything goes wrong or you just want to reset the console use # tput reset" 
pause "Press Enter to clear the screen, reset the console and finish this script"
tput reset 

