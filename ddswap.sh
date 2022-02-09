#!/bin/bash
# auth Martin-Winfred
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ find /mnt/swap ]; then
   echo -e '${red}请勿重复添加或删除原有的再添加${plain}'
fi

echo -e "Input how many swap you want to make (MB)\n Eg.2048"
echo "Warning Do not use oversized space"
read coun
dd if=/dev/zero of=/mnt/swap bs=1M count=$coun

mkswap /mnt/swap
swapon /mnt/swap
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
echo 'swap 添加成功'
free -h
