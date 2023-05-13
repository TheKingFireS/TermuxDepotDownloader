#!/data/data/com.termux/files/usr/bin/sh
# Only use this if you're in PRoot.
apt update && apt upgrade -y
apt install wget libicu67 -y
wget "https://download.visualstudio.microsoft.com/download/pr/7039aeff-2d14-46b3-a560-e5af5591d6c6/3cb3a4aae10e161413fda1100007551a/dotnet-runtime-6.0.16-linux-arm.tar.gz"
mkdir dotnet && cd dotnet
tar -xf ../dotnet-runtime-6.0.16-linux-arm.tar.gz
cd ..
chmod u+x dotnet/dotnet
wget "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.4.7/depotdownloader-2.4.7.zip"
mkdir depotdownloader && cd depotdownloader
unzip ../depotdownloader-2.4.7.zip
