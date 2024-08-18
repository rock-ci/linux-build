#!/bin/bash
set -euo pipefail

. ./defaults

LINUX_REPO="${LINUX_REPO_WD:-$DEF_LINUX_REPO}"
LINUX_REF="${LINUX_REF_WD:-$DEF_LINUX_REF}"
LINUX_ARCH="${LINUX_ARCH_WD:-$DEF_LINUX_ARCH}"
LINUX_CONFIG="${LINUX_CONFIG_WD:-$DEF_LINUX_CONFIG}"

echo "::set-output name=linux_repo::${LINUX_REPO}"
echo "::set-output name=linux_ref::${LINUX_REF}"
echo "::set-output name=linux_arch::${LINUX_ARCH}"
echo "::set-output name=linux_config::${LINUX_CONFIG}"

# Set environment variables for Linux kernel compile:
echo "ARCH=${LINUX_ARCH}" >> "$GITHUB_ENV"
case "$LINUX_ARCH_$(uname -m)" in
  arm64_aarch64)
    # native compilation
    ;;
  arm64_*)
    echo "CROSS_COMPILE=aarch64-linux-gnu-" >> "$GITHUB_ENV"
    ;;
  *)
    echo "Unsupported ARCH for CROSS_COMPILE: $LINUX_ARCH"
esac