#!/bin/bash
#Identify USER
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if find /mnt/swap; then
   echo -e '你已经在此目录下拥有swap请勿重复添加或删除原有的再添加'
   exit
else
   echo -e '可以继续添加'
fi

if [ "$1" == "-default" ]; then
    dd if=/dev/zero of=/mnt/swap bs=1M count=2048
else
    echo -e "Input how many swap you want to make (MB)\n Eg.2048"
   echo "Warning Do not use oversized space"
   read coun
   dd if=/dev/zero of=/mnt/swap bs=1M count=$coun
fi

mkswap /mnt/swap
swapon /mnt/swap
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
echo 'swap 添加成功'
free -h
exit 0