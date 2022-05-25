#!/bin/bash
#Identify USER

if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

function menu(
clear

echo "1) Create Swap"

echo "2) Disable Swap"

echo "3) Enable Swap"

echo "0) Exit"
)

#createSwap
function 1(

clear
bash ddswap.sh -D

)

#offSwap
function 3(
clear

swapoff /mnt/swap
)

#onSwap
function 2(
clear

swapon /mnt/swap
)

#Exit
function 0(
exit 0
)

exit 0

