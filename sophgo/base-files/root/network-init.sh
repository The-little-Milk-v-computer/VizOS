##
## network settings
##
echo "first init bash?(y or n)"
read answer

case "$answer" in
"y"|\
"Y")

echo "请输入您定义的设备静态ip地址:"
read ipaddr

if [ -z "$ipaddr" ]; then
    echo 'ipaddress is 192.168.1.129'
elif [ ipaddr != "192.168.1.129" ]; then
    sed -i 's/192.168.1.129/$(ipaddr)/g' /etc/network-init.sh
else
    echo 'ipaddress is 192.168.1.129'
fi

echo "请输入您路由器或网关的ip地址:"
read gwaddr

if [ -z "$ipaddr" ]; then
    echo 'gwaddr is 192.168.1.1'
elif [gwaddr != "192.168.1.1"]; then
    sed -i 's/192.168.1.1/$(gwaddr)/g' /etc/network-init.sh
else
    echo 'gwaddr is 192.168.1.1'
fi
;;
*)
    echo "initial..."
;;
esac

chmod +x /etc/network-init.sh
. /etc/network-init.sh

echo "The network setup OK!"