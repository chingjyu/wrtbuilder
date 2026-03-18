# 配置软件源
sed -i 's|downloads\.immortalwrt\.org|immortalwrt.kyarucloud.moe|g' /etc/apk/repositories.d/distfeeds.list
# 配置 OpenWrt-momo
wget -O - https://github.com/nikkinikki-org/OpenWrt-momo/raw/refs/heads/main/feed.sh | ash
# 配置 NaiveProxy (libcronet)
wget -O /usr/bin/libcronet.so \
  "https://github.com/SagerNet/cronet-go/releases/latest/download/libcronet-linux-arm64.so" \
&& chmod 0755 /usr/bin/libcronet.so
