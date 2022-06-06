#!/bin/bash
#Identify USER
if [ $EUID -ne 0 ]; then
    echo "This script must be run as root" 1>2
    exit 1
fi

wget -N --no-check-certificate https://raw.githubsercontent.com/Jerry-Zheng-bilibili/dd-swap-/main/ddswap.sh

clear

echo "1) Create Swap"

echo "2) Disable Swap"

echo "3) Enable Swap"

echo "4) Unstall Swap"

echo "5) Only Generate Swap"

echo "0) Exit"
read choise

#createSwap
function createSwap() (
    clear
    bash $(pwd)/ddswap.sh
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

#uninstallSwap
function uninstallSwap() (
    clear
    swapoff /mnt/swap
    rm /mnt/swap
)

#generateSwap
function generateSwap() (
    clear
    if [ "$1" == "-D" ]; then 
        dd if=/dev/zero of=/mnt/swap bs=1M count=2048 
    else 
        echo -e "Input how many swap you want to make (MB)\n Eg.2048" 
        echo "Warning Do not use oversized space" 
        read coun 
        dd if=/dev/zero of=/mnt/swap bs=1M count=$coun
    fi

    mkswap /mnt/swap
)

case $choise in
    1)
    createSwap;;
    2)
    offSwap;;
    3)
    onSwap;;
    4)
    uninstallSwap;;
    5)
    generateSwap;;
    0)
    echo "Bye"
    exit 1;;
esac