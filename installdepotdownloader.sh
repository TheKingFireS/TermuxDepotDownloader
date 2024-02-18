#!/usr/bin/env sh
# Only use this if you're in PRoot.
arch=$(arch)
if [ "$arch" = "i686" ]; then
	echo "X86_32 architecture detected, unsupported."
	exit 1
fi
apk update && apk upgrade
apk add dotnet6-runtime
wget "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/depotdownloader-2.5.0.zip"
mkdir depotdownloader && cd depotdownloader || exit
unzip ../depotdownloader-2.5.0.zip
rm ../depotdownloader-2.5.0.zip DepotDownloader.exe DepotDownloader.pdb
