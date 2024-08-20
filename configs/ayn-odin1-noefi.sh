#!/bin/sh -eux
make defconfig sdm845.config
scripts/config -d CONFIG_EFI -d CONFIG_EFI_STUB
scripts/config -e CONFIG_BOOT_PRINTK_DELAY
