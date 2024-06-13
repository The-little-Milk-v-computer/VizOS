# *VizOS is an open-source IP Camera OS based on OpenWrt*

如果是duo256m的开发板,你需要在烧录好以后，打开sd卡，进入boot目录，将你的可用的boot.sd和fip.bin替换掉原本的bootloader。之后，插卡启动即可。(不好意思，暂时还不会改uboot，只会抄作业😅)

## 在进入系统后，如没有网络，你需要修改文件network-init.sh
### 1. 执行vi /etc/network-init.sh

    将文件内部以192.168开头的两个地址进行修改，以下为具体修改过程:

    ifconfig eth0 192.168.1.129 up # 修改为自己的开发板网口ip地址
    route add default gw 192.168.1.1 # 修改为开发板网线链接的路由器或者网关的lan口ip地址

### 2. 或者执行以下命令:

    sed -i 's/192.168.1.129/你想给开发板设置的ip地址/g' /etc/network-init.sh
    sed -i 's/192.168.1.1/你的路由器ip地址/g' /etc/network-init.sh
    

然后,执行chmod +x network-init.sh && ./network-init.sh

一般会成功启动网络，你可以试试ping一下百度或者github等网站，一般能ping通就可以使用网络了。后续也可以使用ssh远程链接duo.

## 你也可以直接运行root目录下的脚本初始化网络!!!

若要打开luci,需要在目录istoreos/package/feeds/luci/rpcd-mod-rrdns/CMakeList.txt中将resolv相关参数配置删除即可通过编译。但仍需注意，浏览器输入luci后台地址后会一直转圈，无法进入luci界面。初步抓包发现浏览器不能下载/www中的背景图片，多次尝试均为404Error，只有第一次烧录后用手机登录加载了初始界面，后续再次尝试甚至重新烧录镜像均加载失败。解决方法二，尝试去duo-buildroot-sdk中寻找已经编译好的resolv.a库文件复制到istoreos/staging_dir/target-riscv64-unknown-linux-musl_musl/usr/lib中可以解决缺少resolv依赖报错.
我很菜，暂不知原因，待排查。micropython-nossl可用.