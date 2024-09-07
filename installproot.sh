#!/data/data/com.termux/files/usr/bin/env sh
# Download and install proot debian
arch=$(dpkg --print-architecture)
installersetup() {
	pkg upgrade -y -o Dpkg::Options::="--force-confold"
	pkg install proot-distro -y
	proot-distro install debian
	ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/ /data/data/com.termux/files/home/droot
}

if [ "$arch" = "x86_64" ]; then
	echo "X86_64 Architecture"
	installersetup
elif [ "$arch" = "arm" ]; then
	echo "ARM32 Architecture"
	installersetup
elif [ "$arch" = "aarch64" ]; then
	echo "ARM64 Architecture"
	echo "Added 'export DOTNET_GCHeapHardLimit=1C0000000' workaround"
	installersetup
	echo "export DOTNET_GCHeapHardLimit=1C0000000" >> $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
