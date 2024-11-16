#!/usr/bin/env sh
# Only use this if you're in PRoot.
arch=$(dpkg --print-architecture)
installersetup() {
	apt update && apt full-upgrade -y
}
dlfile() {
	url="$1"
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo "DepotDownloader.zip" "$url"
}
if [ "$arch" = "amd64" ]; then
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.4/DepotDownloader-linux-x64.zip"
elif [ "$arch" = "armhf" ]; then
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.4/DepotDownloader-linux-arm.zip"
elif [ "$arch" = "arm64" ]; then
	installersetup
	dlfile "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.4/DepotDownloader-linux-arm64.zip"
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
if [ ! -d "depotdownloader" ]; then
	mkdir depotdownloader && cd depotdownloader || exit
	unzip -j ../DepotDownloader.zip "DepotDownloader"
	rm ../DepotDownloader.zip
	chmod u+x DepotDownloader
else
	echo "DepotDownloader already installed, exiting..."
	exit 0
fi
