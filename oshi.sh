#!/bin/bash 
# Name: oshi.sh 
# Version: 0.01
# Author: Cesar Villegas Ureta - https//www.slayerx.org/
# GitHub repo: https://github.com/cvillegas/bash 
# License: MIT License
# Description: Upload any file to Oshi service (https://oshi.at) the resultant link will be alive for 15 mins.

checkInternet()
{
  curl -A curl -s www.google.com > /dev/null 2>&1 || { echo "Error: No active internet connection" >&2; return 1; } 
}

usage()
{
  cat <<EOF

Usage: oshi.sh file 
  
Example:
   oshi.sh my_secret_file.txt 
EOF
}

checkInternet || exit 1

FILE=$1 

[ $# -eq 0 ] && { usage; exit 1; }
[ ! -f "$FILE" ] && { echo "Error: $1 file not found."; exit 2; }

if [ -r "$FILE" ] && [ -s "$FILE" ]
then
    echo "Uploading $FILE"
    curl -T $1 https://oshi.at
else 
    echo "ERROR: the file $FILE is empty"
fi




