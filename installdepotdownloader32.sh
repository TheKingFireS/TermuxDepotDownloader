#!/bin/sh
# Only use this if you're in PRoot.
apt update && apt full-upgrade -y
apt install wget libicu72 -y
wget "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.5.0/DepotDownloader-linux-arm.zip"
mkdir depotdownloader && cd depotdownloader
unzip ../DepotDownloader-linux-arm.zip
chmod +x DepotDownloader
