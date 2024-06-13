#!/bin/bash

# 进入根目录
cd /

# 设置 Cloudflare API 密钥
CFKEY="UYwNse0t0KEW3Zj012DUa-drA8aNEzLG1LtP7iOw"

# 下载 cf-v4-ddns.sh 文件
wget -q https://raw.githubusercontent.com/jamespan2012/myshellscripts/main/cf-v4-ddns.sh -O cf-v4-ddns.sh

# 确保脚本文件存在且已下载成功
if [[ ! -f "cf-v4-ddns.sh" ]]; then
  echo "cf-v4-ddns.sh 文件下载失败。"
  exit 1
fi

# 提示用户输入 CFZONE_NAME 值
read -p "输入 Cloudflare 区域名称：" CFZONE_NAME

# 提示用户输入 CFRECORD_NAME 值
read -p "输入 Cloudflare 记录名称：" CFRECORD_NAME

# 更改 cf-v4-ddns.sh 文件中的值
sed -i "s/^CFKEY=.*/CFKEY=\"$CFKEY\"/" cf-v4-ddns.sh
sed -i "s/^CFZONE_NAME=.*/CFZONE_NAME=\"$CFZONE_NAME\"/" cf-v4-ddns.sh
sed -i "s/^CFRECORD_NAME=.*/CFRECORD_NAME=\"$CFRECORD_NAME\"/" cf-v4-ddns.sh

echo "cf-v4-ddns.sh 中的值已成功更新！"

# 添加执行权限
chmod +x cf-v4-ddns.sh

# 执行 cf-v4-ddns.sh 脚本
bash cf-v4-ddns.sh

# 添加定时任务到 crontab
(crontab -l ; echo "*/1 * * * * /root/cf-v4-ddns.sh >/dev/null 2>&1") | crontab -

echo "Cron成功！"
