#!/usr/bin/env sh
# Only use this if you're in PRoot.
arch=$(arch)
installersetup() {
	apt update && apt full-upgrade -y
	apt install libicu72 -y
}
dlfile() {
	url="$1"
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo "DepotDownloader.zip" "$url"
}
if [ "$arch" = "x86_64" ]; then
	echo "X86_64 Architecture"
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-x64.zip"
elif echo "$arch" | grep -q 'armv[7-9]l$'; then
	echo "ARM32 Architecture"
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-arm.zip"
elif [ "$arch" = "aarch64" ]; then
	echo "ARM64 Architecture"
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-arm64.zip"
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
if [ ! -d "depotdownloader" ]; then
	mkdir depotdownloader && cd depotdownloader || exit
	unzip ../DepotDownloader.zip
	rm ../DepotDownloader.zip
	chmod u+x DepotDownloader
else
	echo "DepotDownloader already installed, exiting..."
	exit 0
fi
