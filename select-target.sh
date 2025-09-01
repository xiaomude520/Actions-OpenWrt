#!/bin/bash

TARGET_ARCH=$1

case $TARGET_ARCH in
    "x86_64")
        echo "CONFIG_TARGET_x86=y" > target-config
        echo "CONFIG_TARGET_x86_64=y" >> target-config
        echo "CONFIG_TARGET_x86_64_DEVICE_generic=y" >> target-config
        ;;
    "x86_generic")
        echo "CONFIG_TARGET_x86=y" > target-config
        echo "CONFIG_TARGET_x86_generic=y" >> target-config
        echo "CONFIG_TARGET_x86_generic_DEVICE_generic=y" >> target-config
        ;;
    "ramips_mt7621")
        echo "CONFIG_TARGET_ramips=y" > target-config
        echo "CONFIG_TARGET_ramips_mt7621=y" >> target-config
        echo "CONFIG_TARGET_ramips_mt7621_DEVICE_generic=y" >> target-config
        ;;
    "ipq60xx")
        echo "CONFIG_TARGET_ipq60xx=y" > target-config
        echo "CONFIG_TARGET_ipq60xx_64=y" >> target-config
        echo "CONFIG_TARGET_ipq60xx_DEVICE_generic=y" >> target-config
        ;;
    "all")
        echo "CONFIG_TARGET_MULTI_PROFILE=y" > target-config
        echo "CONFIG_TARGET_ALL_PROFILES=y" >> target-config
        echo "CONFIG_TARGET_x86_64_DEVICE_generic=y" >> target-config
        echo "CONFIG_TARGET_x86_generic_DEVICE_generic=y" >> target-config
        echo "CONFIG_TARGET_ramips_mt7621_DEVICE_generic=y" >> target-config
        echo "CONFIG_TARGET_ipq60xx_DEVICE_generic=y" >> target-config
        ;;
    *)
        echo "使用默认架构: ramips_mt7621"
        echo "CONFIG_TARGET_ramips=y" > target-config
        echo "CONFIG_TARGET_ramips_mt7621=y" >> target-config
        echo "CONFIG_TARGET_ramips_mt7621_DEVICE_generic=y" >> target-config
        ;;
esac

# 合并到主配置
cat target-config >> openwrt/.config
rm target-config