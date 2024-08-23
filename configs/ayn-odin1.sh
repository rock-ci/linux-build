#!/bin/sh -eux
make defconfig sdm845.config
scripts/config -m CONFIG_SENSORS_PWM_FAN
