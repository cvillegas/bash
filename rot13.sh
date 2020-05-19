#!/bin/bash
# Name: rot13.sh
# Version: 0.01
# Author: Cesar Villegas Ureta - https//www.slayerx.org/
# GitHub repo: https://github.com/cvillegas/bash 
# License: MIT License
# Description: ROT13 decoder 

usage() 
{
  cat <<EOF

Usage: rot13.sh string_to_convert
  
Example:
   rot13.sh "ivfvg zl oybt uggcf://jjj.fynlrek.bet/" 
EOF
}


[ $1 -eq 0 ] && { usage; exit 1; }

echo $1 | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'