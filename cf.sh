# 下载 cf-v4-ddns.sh 文件
cd /根目录

# Cloudflare API 密钥
CFKEY="UYwNse0t0KEW3Zj012DUa-drA8aNEzLG1LtP7iOw"

wget -q https://raw.githubusercontent.com/jamespan2012/myshellscripts/main/cf-v4-ddns.sh -O cf-v4-ddns.sh


# 提示用户输入 CFZONE_NAME 值
read -p "输入 Cloudflare 区域名称：" CFZONE_NAME

# 提示用户输入 CFRECORD_NAME 值
read -p "输入 Cloudflare 记录名称：" CFRECORD_NAME

# 更改 cf-v4-ddns.sh 文件中的值
sed -i "s/aCFKEY=.*/CFKEY=\"$CFKEY\"/" cf-v4-ddns.sh
sed -i "s/aCFZONE_NAME=.*/CFZONE_NAME=\"$CFZONE_NAME\"/" cf-v4-ddns.sh
sed -i "s/aCFRECORD_NAME=.*/CFRECORD_NAME=\"$CFRECORD_NAME\"/" cf-v4-ddns.sh

echo "cf-v4-ddns.sh 中的值已成功更新！"

回显“*/1 * * * * /root/cf-v4-ddns.sh >/dev/null 2>&1”>> mycron
crontab 复制代码
rm 迈克龙

echo "Cron成功！"
