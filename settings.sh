2# shellcheck shell=bash disable=2034

# Packages to install
# You can add packages that you want and remove packages that you don't need
# Apart from packages from the official Arch repos, you can also specify
# packages from the Chaotic-AUR repo
PACKAGES=(
	# audio
	alsa-lib lib32-alsa-lib alsa-plugins lib32-alsa-plugins libpulse
	lib32-libpulse alsa-tools alsa-utils pipewire lib32-pipewire pipewire-pulse pipewire-jack lib32-pipewire-jack
	# core
	xorg-xwayland qt6-wayland wayland lib32-wayland qt5-wayland xorg-server-xephyr gamescope
	# video
	mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon
	vulkan-intel lib32-vulkan-intel
	vulkan-icd-loader lib32-vulkan-icd-loader vulkan-mesa-layers
	lib32-vulkan-mesa-layers libva-intel-driver lib32-libva-intel-driver
	intel-media-driver mesa-utils vulkan-tools libva-utils lib32-mesa-utils
	# development
	base-devel git meson mingw-w64-gcc cmake
	# extra
	ttf-dejavu ttf-liberation firefox mpv
	htop qbittorrent speedcrunch feh file-roller krusader
	yt-dlp minizip nautilus
 	# fork extras
 	obs-studio qbittorrent bottles libreoffice-fresh
)

# If you want to install AUR packages, specify them in this variable
AUR_PACKAGES=(localsend-bin)

# ALHP is a repository containing packages from the official Arch Linux
# repos recompiled with -O3, LTO and optimizations for modern CPUs for
# better performance
#
# When this repository is enabled, most of the packages from the official
# Arch Linux repos will be replaced with their optimized versions from ALHP
#
# Set this variable to any value if you want to enable this repository
ENABLE_ALHP_REPO=

# Feature levels for ALHP. Available feature levels are 2 and 3
# For level 2 you need a CPU with SSE4.2 instructions
# For level 3 you need a CPU with AVX2 instructions
ALHP_FEATURE_LEVEL=2

# Locales to configure in the image
LOCALES=(
	'ar_EG.UTF-8 UTF-8'
	'en_US.UTF-8 UTF-8'
	'en_GB.UTF-8 UTF-8'
	'en_CA.UTF-8 UTF-8'
	'en_SG.UTF-8 UTF-8'
	'es_MX.UTF-8 UTF-8'
	'zh_CN.UTF-8 UTF-8'
	'fr_FR.UTF-8 UTF-8'
	'ru_RU.UTF-8 UTF-8'
	'ru_UA.UTF-8 UTF-8'
	'es_ES.UTF-8 UTF-8'
	'de_DE.UTF-8 UTF-8'
	'pt_BR.UTF-8 UTF-8'
	'it_IT.UTF-8 UTF-8'
	'id_ID.UTF-8 UTF-8'
	'ja_JP.UTF-8 UTF-8'
	'bg_BG.UTF-8 UTF-8'
	'pl_PL.UTF-8 UTF-8'
	'da_DK.UTF-8 UTF-8'
	'ko_KR.UTF-8 UTF-8'
	'tr_TR.UTF-8 UTF-8'
	'hu_HU.UTF-8 UTF-8'
	'cs_CZ.UTF-8 UTF-8'
	'bn_IN UTF-8'
	'hi_IN UTF-8'
)

# Content of pacman mirrorrlist file before reflector is installed and used to fetch new one
# shellcheck disable=2016
MIRRORLIST='
Server = https://mirror1.sl-chat.ru/archlinux/$repo/os/$arch
Server = https://mirror3.sl-chat.ru/archlinux/$repo/os/$arch
Server = https://us.mirrors.cicku.me/archlinux/$repo/os/$arch
Server = https://mirror.osbeck.com/archlinux/$repo/os/$arch
Server = https://md.mirrors.hacktegic.com/archlinux/$repo/os/$arch
Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirror.qctronics.com/archlinux/$repo/os/$arch
Server = https://arch.mirror.constant.com/$repo/os/$arch
Server = https://america.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirror.tmmworkshop.com/archlinux/$repo/os/$arch
'

# Enable this variable to use the system-wide mksquashfs/mkdwarfs instead
# of those provided by the Conty project
USE_SYS_UTILS=0

# Supported compression algorithms: lz4, zstd, gzip, xz, lzo
# These are the algorithms supported by the integrated squashfuse
# However, your squashfs-tools (mksquashfs) may not support some of them
SQUASHFS_COMPRESSOR="zstd"
SQUASHFS_COMPRESSOR_ARGUMENTS=(-b 1M -comp "${SQUASHFS_COMPRESSOR}" -Xcompression-level 19)

# Uncomment these variables if your mksquashfs does not support zstd or
# if you want faster compression/decompression (at the cost of compression ratio)
#SQUASHFS_COMPRESSOR="lz4"
#SQUASHFS_COMPRESSOR_ARGUMENTS=(-b 256K -comp "${SQUASHFS_COMPRESSOR}" -Xhc)

# Set to any value to Use DwarFS instead of SquashFS
USE_DWARFS=
DWARFS_COMPRESSOR_ARGUMENTS=(
	-l7 -C zstd:level=19 --metadata-compression null
	-S 21 -B 1 --order nilsimsa
	-W 12 -w 4 --no-create-timestamp
)


# List of links to arch bootstrap archive
# Conty will try to download each one of them sequentially
BOOTSTRAP_DOWNLOAD_URLS=(
	'https://arch.hu.fo/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.cyberbits.eu/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.osbeck.com/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.lcarilla.de/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.moson.org/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.f4st.host/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
)

# sha256sums.txt file to verify downloaded bootstrap archive with
BOOTSTRAP_SHA256SUM_FILE_URL='https://archlinux.org/iso/latest/sha256sums.txt'

# Set to any value to use an existing image if it exists
# Otherwise the script will always create a new image
USE_EXISTING_IMAGE=
