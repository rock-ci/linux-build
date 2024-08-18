#!/bin/bash
set -euo pipefail

. ./defaults

LINUX_REPO="${LINUX_REPO_WD:-$DEF_LINUX_REPO}"
LINUX_REF="${LINUX_REF_WD:-$DEF_LINUX_REF}"
LINUX_ARCH="${LINUX_ARCH_WD:-$DEF_LINUX_ARCH}"
LINUX_CONFIG="${LINUX_CONFIG_WD:-$DEF_LINUX_CONFIG}"

echo "linux_repo=${LINUX_REPO}" >> "$GITHUB_OUTPUT"
echo "linux_ref=${LINUX_REF}" >> "$GITHUB_OUTPUT"
echo "linux_arch=${LINUX_ARCH}" >> "$GITHUB_OUTPUT"
echo "linux_config=${LINUX_CONFIG}" >> "$GITHUB_OUTPUT"

# Set environment variables for Linux kernel compile:
echo "ARCH=${LINUX_ARCH}" >> "$GITHUB_ENV"
case "${LINUX_ARCH}_$(uname -m)" in
  arm64_aarch64)
    # native compilation
    ;;
  arm64_*)
    echo "CROSS_COMPILE=aarch64-linux-gnu-" >> "$GITHUB_ENV"
    ;;
  *)
    echo "Unsupported ARCH for CROSS_COMPILE: $LINUX_ARCH"
esac