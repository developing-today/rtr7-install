#!/usr/bin/env bash
# Prerequisites: `./00-rtr7-setup.sh` exit 0
set -v
GOARCH=amd64 gokr-packer \
	-hostname=router7 \
	-overwrite_boot=/tmp/recovery/boot.img \
	-overwrite_mbr=/tmp/recovery/mbr.img \
	-overwrite_root=/tmp/recovery/root.img \
	-eeprom_package= \
	-kernel_package=github.com/rtr7/kernel \
	-firmware_package=github.com/rtr7/kernel \
	-gokrazy_pkgs=github.com/gokrazy/gokrazy/cmd/ntp \
	-serial_console=ttyS0,115200n8 \
	github.com/rtr7/router7/cmd/...
