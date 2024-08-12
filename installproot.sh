#!/data/data/com.termux/files/usr/bin/env sh
# Download and install proot debian
# setting env
arch=$(dpkg --print-architecture)
username="user"

installersetup() {
	#update and installing required termux packages
	pkg upgrade -y -o Dpkg::Options::="--force-confold"
	pkg install proot-distro unzip -y
	proot-distro install debian
	#update and installing required debian packages
	proot-distro login debian --shared-tmp -- apt update
	proot-distro login debian --shared-tmp -- apt dist-upgrade -y
	proot-distro login debian --shared-tmp -- apt install sudo libicu72 -y
	proot-distro login debian --shared-tmp -- apt autoclean
	proot-distro login debian --shared-tmp -- apt clean
	#add user
	proot-distro login debian --shared-tmp -- groupadd storage
	proot-distro login debian --shared-tmp -- groupadd wheel
	proot-distro login debian --shared-tmp -- useradd -m -g users -G wheel,storage -s /bin/bash "$username"
	chmod u+rw $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/sudoers
	echo "$username ALL=(ALL) NOPASSWD:ALL" | tee -a $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/sudoers > /dev/null
	chmod u-w  $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/sudoers
	#setup storage and directory for depotdownloader
	if [ ! -d "storage" ]; then
		termux-setup-storage
	elif [ ! -d "storage/downloads/depotdownloaded" ]; then
		mkdir storage/downloads/depotdownloaded
	fi
}

dlfile() {
	#download file and extract file to debian's bin executable directory
	url="$1"
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo "DepotDownloader.zip" "$url"
	unzip -j DepotDownloader.zip "DepotDownloader" -d $PREFIX/var/lib/proot-distro/installed-rootfs/debian/usr/bin
	rm DepotDownloader.zip
	chmod u+x $PREFIX/var/lib/proot-distro/installed-rootfs/debian/usr/bin/DepotDownloader
	#download wrapper file for depotdownloader
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo $PREFIX/bin/depotdownloader "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotDownloader/wrapper/depotdownloader.sh"
	chmod +x $PREFIX/bin/depotdownloader
}
# end of setting env

if [ "$arch" = "amd64" ]; then
	echo "X86_64 Architecture"
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.6.0/DepotDownloader-linux-x64.zip"
elif [ "$arch" = "arm" ]; then
	echo "ARM32 Architecture"
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.6.0/DepotDownloader-linux-arm.zip"
elif [ "$arch" = "aarch64" ]; then
	echo "ARM64 Architecture"
	echo "Added 'GC heap initialization failed with error 0x8007000E' workaround"
	installersetup
	echo "export DOTNET_GCHeapHardLimit=1C0000000" >> $PREFIX/var/lib/proot-distro/installed-rootfs/debian/etc/profile
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.6.0/DepotDownloader-linux-arm64.zip"
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
