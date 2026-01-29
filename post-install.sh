# 配置软件源
sed -i 's|downloads\.immortalwrt\.org|mirror.nju.edu.cn/immortalwrt|g' /etc/apk/repositories.d/distfeeds.list
# 添加 OpenWrt-momo 软件源
wget -O - https://github.com/nikkinikki-org/OpenWrt-momo/raw/refs/heads/main/feed.sh | ash
# 配置 NaiveProxy
cat << 'EOF' > /etc/init.d/naiveproxy
#!/bin/sh /etc/rc.common

USE_PROCD=1
START=99

# Change these paths if your files are located elsewhere
PROG=/usr/bin/naive
CONF=/etc/naiveproxy/config.json

start_service() {
    procd_open_instance
    procd_set_param command "$PROG" "$CONF"
    procd_set_param respawn
    procd_set_param stdout 1
    procd_set_param stderr 1
    procd_close_instance
}

stop_service() {
    killall naive
}
EOF

mkdir /etc/naiveproxy

cat << 'EOF' > /etc/naiveproxy/config.json
{
  "listen": "socks://127.0.0.1:1080",
  "proxy": "https://user:pass@example.com"
}
EOF

/etc/init.d/naiveproxy enable