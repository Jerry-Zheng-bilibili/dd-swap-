#!/bin/bash
dd if=/dev/zero of=/mnt/swap bs=1M count=2048
mkswap /mnt/swap
swapon /mnt/swap
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab