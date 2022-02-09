#!/bin/bash
# auth Martin-Winfred
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo -e "Input how many swap you want to make (MB)\n Eg.2048"
echo "Worning Do not use oversized space"
read coun
dd if=/dev/zero of=/mnt/swap bs=1M count=$coun

mkswap /mnt/swap
swapon /mnt/swap
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
echo 'swap 添加成功 请通过free -h查看'
