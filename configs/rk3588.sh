#!/bin/bash -eux
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp "${SCRIPT_DIR}/nanopc.config" arch/arm64/configs
make defconfig nanopc.config
