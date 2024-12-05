
echo "1.设置代理"
echo "2.取消代理"

read -p "请输入选项:" options

if (($options == 1));then
	
        read -p "请输入ip地址：" ipAddress
        read -p "请输入端口：" ipPort
	echo "正在配置代理..."
	sed -i "s|export http_proxy=.*|export http_proxy=http://${ipAddress}:${ipPort}|" /etc/profile
	sed -i "s|export https_proxy=.*|export https_proxy=http://${ipAddress}:${ipPort}|" /etc/profile
	source /etc/profile
	echo "代理配置完成，请重新进入会话。"
elif (($options == 2));then
	echo "正在取消代理..."
	sed -i 's|export http_proxy=.*|export http_proxy=|' /etc/profile
	sed -i 's|export https_proxy=.*|export https_proxy=|' /etc/profile
	source /etc/profile
	echo "代理取消完成，请重新进入会话。"
else 
	echo "请输入正确的选项!!!"
fi
