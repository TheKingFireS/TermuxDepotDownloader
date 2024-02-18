#!/usr/bin/env sh
# Only use this if you're in PRoot.
arch=$(arch)
apt update && apt full-upgrade -y
apt install wget libicu72 -y
if [ "$arch" = "x86_64" ]; then
	echo "X86_64 Architecture"
	wget -O "DepotDownloader.zip" "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-x64.zip"
elif echo "$arch" | grep -q 'armv[7-9]l$'; then
	echo "ARM32 Architecture"
	wget -O "DepotDownloader.zip" "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-arm.zip"
elif [ "$arch" = "aarch64" ]; then
	echo "ARM64 Architecture"
	wget -O "DepotDownloader.zip" "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-arm64.zip"
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
mkdir depotdownloader && cd depotdownloader || exit
unzip ../DepotDownloader.zip
rm ../DepotDownloader.zip
chmod u+x DepotDownloader
