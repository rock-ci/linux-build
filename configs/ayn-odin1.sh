#!/bin/sh -eux
make defconfig sdm845.config
scripts/config -e CONFIG_BOOT_PRINTK_DELAY
