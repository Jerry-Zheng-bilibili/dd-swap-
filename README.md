# dd硬盘成swap大小的
这个是dd2GBswap的
```
dd if=/dev/zero of=/mnt/swap bs=1M count=2048
mkswap /mnt/swap
swapon /mnt/swap
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
```
只要将count后面的数字换成你想要的大小就可以了，
如果不想换算的话就吧bs后面的换成1G就好了，这样count后面的就只要填你所想要的GB大小了
