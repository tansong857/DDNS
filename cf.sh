#!/bin/bash

# 下载 cf-v4-ddns.sh 文件
cd /root

# Cloudflare API 密钥
CFKEY="UYwNse0t0KEW3Zj012DUa-drA8aNEzLG1LtP7iOw"

wget -q https://raw.githubusercontent.com/jamespan2012/myshellscripts/main/cf-v4-ddns.sh -O cf-v4-ddns.sh

# 提示用户输入 CFZONE_NAME 值
read -p "输入 Cloudflare 区域名称：" CFZONE_NAME

# 提示用户输入 CFRECORD_NAME 值
read -p "输入 Cloudflare 记录名称：" CFRECORD_NAME

# 更改 cf-v4-ddns.sh 文件中的值
sed -i "s/^CFKEY=.*/CFKEY=\"$CFKEY\"/" cf-v4-ddns.sh
sed -i "s/^CFZONE_NAME=.*/CFZONE_NAME=\"$CFZONE_NAME\"/" cf-v4-ddns.sh
sed -i "s/^CFRECORD_NAME=.*/CFRECORD_NAME=\"$CFRECORD_NAME\"/" cf-v4-ddns.sh

echo "cf-v4-ddns.sh 中的值已成功更新！"

# 设置 cf-v4-ddns.sh 文件的可执行权限
chmod +x /root/cf-v4-ddns.sh

# 将脚本添加到 crontab 中以每分钟执行一次
(crontab -l 2>/dev/null; echo "*/1 * * * * /root/cf-v4-ddns.sh >/dev/null 2>&1") | crontab -

echo "Cron任务已成功添加！"

# 运行 cf-v4-ddns.sh 脚本
bash /root/cf-v4-ddns.sh
