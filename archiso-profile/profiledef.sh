#!/usr/bin/env bash
# shellcheck disable=SC2034
iso_name="soso-not-so-tinyos"
iso_label="SOSO_TINYOS"
iso_publisher="1234AAA4321qqq"
iso_application="so so not so tinyOS"
iso_version="v1.0.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.systemd-boot')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/customize_airootfs.sh"]="0:0:755"
)
