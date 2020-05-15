#!/bin/bash 
# Name: shorturl.sh
# Version: 0.02
# Author: Cesar Villegas Ureta - https//www.slayerx.org/
# GitHub repo: https://github.com/cvillegas/bash 
# License: MIT License
# Description:  Expand a shortened URL to see if is malicious or not

checkInternet()
{
  curl -A curl -s www.google.com > /dev/null 2>&1 || { echo "Error: No active internet connection" >&2; return 1; } 
}

usage()
{
  cat <<EOF
Usage: shorturl.sh [URL]
  
Example:
   Input:  shorturl.sh tinyurl.com/yaexp86y
   Output: https://www.github.com/cvillegas/bash
EOF
}

expandURL()
{
  testURL=$( echo $1 | cut -c1-8 )
  if [[ $testURL != "https://" ]]; then
    testURL=$( echo $1 | cut -c1-7 )
    if [[ $testURL != "http://" ]]; then
      url="http://$1"
    else
      url=$1
    fi
  else
    url=$1
  fi
  response=$(curl -A curl -s https://unshorten.me/s/$url)
  errorCheck=$(echo $response)
  if [[ $errorCheck == "Invalid Short URL" ]]; then
   usage
  return 1
fi
  returnedURL=$(echo $response)
}

printResults()
{
  cat <<EOF
=====================================================================
Short URL:    $url
Expanded URL: $returnedURL
=====================================================================
EOF
}

  checkInternet || exit 1
  expandURL $1 || exit 1
  printResults