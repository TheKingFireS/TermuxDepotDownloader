#!/usr/bin/env sh
# Only use this if you're in PRoot.
arch=$(dpkg --print-architecture)
installersetup() {
	apt update && apt full-upgrade -y
	apt install libicu72 -y
}
dlfile() {
	url="$1"
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo "DepotDownloader.zip" "$url"
}
if [ "$arch" = "amd64" ]; then
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.2/DepotDownloader-linux-x64.zip"
elif [ "$arch" = "armhf" ]; then
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.2/DepotDownloader-linux-arm.zip"
elif [ "$arch" = "arm64" ]; then
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.2/DepotDownloader-linux-arm64.zip"
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
if [ ! -d "depotdownloader" ]; then
	mkdir depotdownloader && cd depotdownloader || exit
	unzip ../DepotDownloader.zip
	rm ../DepotDownloader.zip
	chmod u+x DepotDownloader
	cd "$HOME" || exit
else
	echo "DepotDownloader already installed, exiting..."
	exit 0
fi
