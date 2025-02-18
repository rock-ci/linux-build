#!/bin/bash -eux
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp "${SCRIPT_DIR}/rockchip.config" arch/arm64/configs
make defconfig rockchip.config
