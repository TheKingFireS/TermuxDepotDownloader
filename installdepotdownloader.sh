#!/bin/bash
# Only use this if you're in PRoot.
arch=$(arch)
if [ "$arch" == "i686" ]; then
	echo "X86_32 architecture detected, unsupported."
	exit
fi
apk upgrade && apk add dotnet6
curl -LO "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/depotdownloader-2.5.0.zip"
mkdir depotdownloader && cd depotdownloader || exit
unzip ../depotdownloader-2.5.0.zip
