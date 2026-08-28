#!/bin/sh -eux
if [[ -n "${GITHUB_ENV:-}" ]]
then
	echo 'LLVM=1' >> "$GITHUB_ENV"
fi
make pinenote_defconfig
