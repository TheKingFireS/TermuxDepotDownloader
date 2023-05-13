#!/data/data/com.termux/files/usr/bin/sh
# Only use this if you're in PRoot.
apt update && apt upgrade -y
apt install wget libicu67 -y
wget "https://download.visualstudio.microsoft.com/download/pr/e7866e12-a380-4994-9c56-1bd3a1e0a546/22a5e54cb4e637c5aac7ec6dcab0d739/dotnet-runtime-6.0.16-linux-arm64.tar.gz"
mkdir dotnet && cd dotnet
tar -xf ../dotnet-runtime-6.0.16-linux-arm64.tar.gz
cd ..
chmod u+x dotnet/dotnet
wget "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.4.7/depotdownloader-2.4.7.zip"
mkdir depotdownloader && cd depotdownloader
unzip ../depotdownloader-2.4.7.zip
