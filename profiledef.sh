#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="kiruhi"
iso_label="KIRUHI_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Kiruhi OS <https://kiruhi.dev>"
iso_application="Kiruhi OS Live/Rescue System"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"

install_dir="kiruhi"

buildmodes=('iso')

bootmodes=('bios.syslinux' 'uefi.systemd-boot')

pacman_conf="pacman.conf"

airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-b' '1M' '-Xdict-size' '1M')

bootstrap_tarball_compression=(
  'zstd'
  '-c'
  '-T0'
  '--auto-threads=logical'
  '-19'
)

file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
