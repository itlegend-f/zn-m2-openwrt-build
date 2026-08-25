#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 替换golang版本为1.26
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 26.x feeds/packages/lang/golang

#增加集客AC
git clone --depth=1 https://github.com/openwrt-fork/openwrt-gecoosac.git feeds/luci/applications/luci-app-gecoosac

#应用过滤
git clone https://github.com/destan19/OpenAppFilter.git feeds/packages/OpenAppFilter

# 移除 OpenWrt Feeds 自带的核心库
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages feeds/packages/passwall-packages

# 移除 OpenWrt Feeds 过时的LuCI版本
rm -rf feeds/luci/applications/luci-app-passwall
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall feeds/luci/applications/luci-app-passwall
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall2 feeds/luci/applications/luci-app-passwall2
#替换openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash feeds/luci/applications/luci-app-openclash

#优先安装 passwall 源
#./scripts/feeds install -a -f -p passwall_packages
#./scripts/feeds install -a -f -p passwall_luci

# 清理 PassWall 的 chnlist 规则文件
# echo "baidu.com"  > package/luci-app-passwall/luci-app-passwall/root/usr/share/passwall/rules/chnlist

./scripts/feeds update -i -a
./scripts/feeds install -a
