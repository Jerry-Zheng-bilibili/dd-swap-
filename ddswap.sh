#!/bin/bash
dd if=/dev/zero of=/mnt/swap bs=1M count=2048
mkswap /mnt/swap
swapon /mnt/swap
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
echo 'swap 添加成功 请通过free -h查看'
