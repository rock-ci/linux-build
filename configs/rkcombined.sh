#!/bin/bash -eux
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_ROOT=$(realpath "${SCRIPT_DIR}/..")

git am -3 "${REPO_ROOT}/patches/rockchip-0054-WIP-2001-dt-bindings-media-Add-Rockchip-IEP-binding.patch"
git am -3 "${REPO_ROOT}/patches/rockchip-0044-WIP-1002-arm64-boot-dts-Increase-ACLK_PERILP0-clock-.patch"
git am -3 "${REPO_ROOT}/patches/rockchip-0055-WIP-2001-media-rockchip-Add-Rockchip-IEP-driver.patch"
git am -3 "${REPO_ROOT}/patches/rockchip-0057-WIP-2001-ARM64-dts-rockchip-Add-IEP-node-for-RK3399.patch"
git am -3 "${REPO_ROOT}/patches/rockchip-0178-WIP-media-rkvdec-Add-VP9-support-for-the-VDPU381-var.patch"
git am -3 "${REPO_ROOT}/patches/0001-drm-rockchip-rk3399-Support-AFBC-on-all-big-VOP-plan.patch"
git am -3 "${REPO_ROOT}/patches/0002-sigmaris-dts-rockpro64-Enable-fast-read-for-spiflash.patch"
git am -3 "${REPO_ROOT}/patches/0001-media-rockchip-rga-Add-support-for-downconverting-fr.patch"

cp "${SCRIPT_DIR}/rockchip.config" arch/arm64/configs
make defconfig rockchip.config
