#!/data/data/com.termux/files/usr/bin/env sh
# Download and install proot alpine (WIP)

# setting env var
arch=$(dpkg --print-architecture)
username="user"
installed_rootfs="$PREFIX/var/lib/proot-distro/installed-rootfs"
# end of setting env var

# setting function
installersetup() {
	# update and installing required termux packages
	pkg upgrade -y -o Dpkg::Options::="--force-confold"
	pkg install proot-distro unzip -y
	pkg autoclean
	pkg clean
	proot-distro install alpine
	# update and installing required alpine packages
	proot-distro login alpine --shared-tmp -- apk update
	proot-distro login alpine --shared-tmp -- apk upgrade
	proot-distro login alpine --shared-tmp -- apk add doas libstdc++ libgcc
	proot-distro login alpine --shared-tmp -- apk cache clean
	rm "$installed_rootfs"/alpine/var/cache/apk/*.apk
	# add user
	proot-distro login alpine --shared-tmp -- addgroup storage
	proot-distro login alpine --shared-tmp -- adduser -G wheel -D $username
	proot-distro login alpine --shared-tmp -- adduser $username storage
	echo "permit nopass :wheel as root" > "$installed_rootfs"/alpine/etc/doas.d/doas.conf
	chmod u-w  "$installed_rootfs"/alpine/etc/doas.d/doas.conf
	# setup storage and directory for depotdownloader
	if [ ! -d "$HOME/storage" ]; then
		termux-setup-storage
		while ! [ -d "$HOME/storage" ]; do
			sleep 0.1
		done
	fi
	if [ ! -d "$HOME/storage/downloads/depotdownloaded" ]; then
		mkdir "$HOME"/storage/downloads/depotdownloaded
	fi
}

dlfile() {
	# download file and extract file to alpine's bin executable directory
	url="$1"
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo "DepotDownloader.zip" "$url"
	unzip -j DepotDownloader.zip "DepotDownloader" -d "$installed_rootfs"/alpine/usr/local/bin
	rm DepotDownloader.zip
	chmod u+x "$installed_rootfs"/alpine/usr/local/bin/DepotDownloader
	# download wrapper file for depotdownloader
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo "$PREFIX"/bin/depotdownloader "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotDownloader/alpine/depotdownloader.sh"
	chmod +x "$PREFIX"/bin/depotdownloader
}

print_red() {
	# Bold red
	printf "\033[1;31m%s\033[0m\n" "$1"
}

print_yellow() {
	# Bold yellow
	printf "\033[1;33m%s\033[0m\n" "$1"
}
# end of setting function

if echo "$TERMUX_VERSION" | grep -q '^googleplay\.'; then
	print_red "==================================================="
	print_red "        !!!!READ THE BELOW MESSAGE HERE!!!!        "
	print_red "==================================================="
	print_yellow "Google Play Store version is actually not updated,"
	print_yellow "it's just fork of same version with some test to"
	print_yellow "conform Google Play Store's insane strict policy,"
	print_yellow "see the info more in Termux dev's GP announcement."
	print_yellow "Check out below URL here:"
	print_yellow "https://github.com/termux/termux-app/discussions/4000"
	print_yellow "Termux dev team recommended you to use Github or"
	print_yellow "F-droid instead of Google Play store version."
	print_yellow "Also, I don't test my script on GP version, so you"
	print_yellow "may get some issues that I don't have that in GH/FD"
	exit 1
fi
if [ "$arch" = "x86_64" ]; then
	echo "X86_64 Architecture"
	installersetup
	dlfile "https://github.com/TheKingFireS/TermuxDepotDownloader/releases/download/selfcontained-alpine/DepotDownloader-linux-musl-x64-unofficial.zip"
elif [ "$arch" = "arm" ]; then
	echo "ARM32 Architecture"
	installersetup
	dlfile "https://github.com/TheKingFireS/TermuxDepotDownloader/releases/download/selfcontained-alpine/DepotDownloader-linux-musl-arm-unofficial.zip"
elif [ "$arch" = "aarch64" ]; then
	echo "ARM64 Architecture"
	echo "Added 'GC heap initialization failed with error 0x8007000E' workaround"
	installersetup
	echo "export DOTNET_GCHeapHardLimit=1C0000000" > "$installed_rootfs"/alpine/etc/profile.d/dotnet.sh
	dlfile "https://github.com/TheKingFireS/TermuxDepotDownloader/releases/download/selfcontained-alpine/DepotDownloader-linux-musl-arm64-unofficial.zip"
# Added it, will uncomment when it get supported.
#elif [ "$arch" = "riscv64" ]; then
#	echo "RISC-V 64bit Architecture"
#	installersetup
#	dlfile "..."
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
exit 0
