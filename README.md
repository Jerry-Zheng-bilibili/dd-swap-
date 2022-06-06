# dd硬盘成swap大小的
逐步执行命令
```
添加swap为2G
dd if=/dev/zero of=/mnt/swap bs=1M count=2048
设置交换分区的文件
mkswap /mnt/swap
启动swap分区
swapon /mnt/swap
设置开机时自启用 swap 分区，需要修改文件 /etc/rc.local  中的 swap 行，添加以下代码
echo '/mnt/swap swap swap defaults 0 0' >> /etc/fstab
```
只要将count后面的数字换成你想要的大小就可以了，

如果不想换算的话就吧bs后面的换成1G就好了，这样count后面的就只要填你所想要的GB大小了

#一键脚本默认打开菜单，选1会自动创建2G的swap在```/mnt```下
```
wget -N --no-check-certificate https://raw.githubusercontent.com/Jerry-Zheng-bilibili/dd-swap-/main/menu.sh && chmod +x menu.sh && ./menu.sh
```
这个会在原来的基础之上添加swap分区
