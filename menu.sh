#!/bin/bash
#Identify USER
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

wget -N --no-check-certificate https://raw.githubusercontent.com/Jerry-Zheng-bilibili/dd-swap-/main/ddswap.sh


clear

echo "1) Create Swap"

echo "2) Disable Swap"

echo "3) Enable Swap"

echo "0) Exit"
read choise

#createSwap
function createSwap() (

clear
bash $(pwd)/ddswap.sh -D

)

#offSwap
function offSwap() (
clear

swapoff /mnt/swap
)

#onSwap
function onSwap() (
clear

swapon /mnt/swap
)



case $choise in
   1)
   createSwap;;
   2)
   offSwap;;
   3)
   onSwap;;
   0)
   echo "Bye"
   exit 1;;
esac
