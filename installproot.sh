#!/data/data/com.termux/files/usr/bin/env sh
# Download and install proot alpine
arch=$(uname -m)
if echo "$arch" | grep -q 'i[3-6]86$'; then
	echo "Unsupported X86 32bit architecture detected, exiting..."
	exit 1
fi
pkg upgrade -y -o Dpkg::Options::="--force-confold"
pkg install proot-distro -y
proot-distro install alpine
ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/alpine/root/ /data/data/com.termux/files/home/droot
