# *VizOS is an open-source IP Camera OS based on OpenWrt*

如果是duo256m的开发板,你需要在烧录好以后，打开sd卡，进入boot目录，将你的可用的boot.sd和fip.bin替换掉原本的bootloader。之后，插卡启动即可。(不好意思，暂时还不会改uboot，只会抄😅)

## 在进入系统后，如没有网络，你需要修改文件network-init.sh
### 1. 执行vi /etc/network-init.sh

    将文件内部以192.168开头的两个地址进行修改，以下为具体修改过程:

    ifconfig eth0 192.168.1.129 up # 修改为自己的开发板网口ip地址
    route add default gw 192.168.1.1 # 修改为开发板网线链接的路由器或者网关的lan口ip地址

### 2. 或者执行以下命令:

    sed -i 's/192.168.1.129/你想给开发板设置的ip地址/g' /etc/network-init.sh
    sed -i 's/192.168.1.1/你的路由器ip地址/g' /etc/network-init.sh
    

然后,执行chmod +x network-init.sh && ./network-init.sh

一般会成功启动网络，你可以试试ping一下百度或者github等网站，一般能ping通就可以使用网络了。

## 你也可以直接运行root目录下的脚本初始化网络!!!
