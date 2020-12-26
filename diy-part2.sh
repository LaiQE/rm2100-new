#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Clone Lean's latest sources.
# pushd package
# git clone --depth=1 https://github.com/coolsnowwolf/lede
# popd

# Copy Lean's packages to ./package/lean.
# mkdir package/lean
# pushd package/lede/package/lean
# cp -r ./* "../../../lean"
# popd

# Default settings
# pushd package/lean
# # git clone --depth=1 https://github.com/SuLingGG/default-settings

# # Add Project OpenWrt's autocore
# rm -rf autocore
# svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/autocore

# # Add luci-app-ssr-plus
# git clone --depth=1 https://github.com/fw876/helloworld
# rm -rf helloworld/luci-app-ssr-plus/po/zh_Hans

# popd

# Clean Lean's code
# pushd package
# rm -rf lede
# popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
# git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add luci-app-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall


# Add mentohust & luci-app-mentohust.
# git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
# git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add ServerChan.
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash.
git clone -b master --depth=1 https://github.com/vernesong/OpenClash

# Add luci-app-onliner. (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
# svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome
# svn co https://github.com/Lienol/openwrt/trunk/package/diy/adguardhome

# Add openwrt-iptvhelper.
git clone --depth=1 https://github.com/riverscn/openwrt-iptvhelper

# Add luci-app-diskman.
# git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
# mkdir parted
# cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-gowebdav
git clone --depth=1 https://github.com/project-openwrt/openwrt-gowebdav

# Add luci-app-jd-dailybonus
git clone --depth=1 https://github.com/jerrykuku/luci-app-jd-dailybonus

# Add luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config

# Add smartdns
# svn co https://github.com/pymumu/smartdns/trunk/package/openwrt ../smartdns
# svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns ../luci-app-smartdns

# Add luci-udptools
git clone --depth=1 https://github.com/zcy85611/openwrt-luci-kcp-udp

# Add luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
sed -i 's/+docker-ce/+docker/g' luci-app-dockerman/applications/luci-app-dockerman/Makefile
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add tmate
git clone --depth=1 https://github.com/project-openwrt/openwrt-tmate

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

popd
# Mod zzz-default-settings
# pushd package/lean/default-settings/files
# sed -i "/commit luci/i\uci set luci.main.mediaurlbase='/luci-static/argon'" zzz-default-settings
# sed -i '/http/d' zzz-default-settings
# sed -i '/exit/i\chmod +x /bin/ipv6-helper' zzz-default-settings
# popd

# Mod ipv6-helper.sh
# sed -i '/filter_aaaa/d;/commit dhcp/d' ../scripts/ipv6-helper.sh

# Remove orig kcptun
# rm -rf ./feeds/packages/net/kcptun

# # Max connections
# sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# # Remove IPV6
# sed -i 's/ip6tables //g' include/target.mk
# sed -i 's/odhcpd-ipv6only odhcp6c //g' include/target.mk

# # Change dnsmasq to dnsmasq-full
# sed -i 's/dnsmasq i/dnsmasq-full i/g' include/target.mk

# # Add po2lmo
# git clone https://github.com/openwrt-dev/po2lmo.git
# pushd po2lmo
# make && sudo make install
# popd

# # Fix mt76 wireless driver
# pushd package/kernel/mt76
# sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
# popd

