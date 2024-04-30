#!/usr/bin/env sh
# Only use this if you're in PRoot.
arch=$(arch)
if [ "$arch" = "i686" ]; then
	echo "X86_32 architecture detected, unsupported."
	exit 1
elif [ "$arch" = "aarch64" ]; then
	echo "export DOTNET_GCHeapHardLimit=1C0000000" >> /etc/profile
	. /etc/profile
fi
apk update && apk upgrade
apk add dotnet8-runtime
wget "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.6.0/DepotDownloader-framework.zip"
mkdir depotdownloader && cd depotdownloader || exit
unzip ../DepotDownloader-framework.zip
rm ../DepotDownloader-framework.zip DepotDownloader.exe DepotDownloader.pdb
cd "$HOME" || exit
