#!/data/data/com.termux/files/usr/bin/env sh
# Download and install depotdownloader
# Will be change once Microsoft/DotNet devs fix "enabling both Singlefile and Self-Contain" bug
# https://github.com/dotnet/sdk/issues/35518

# setting env var
arch=$(dpkg --print-architecture)
# end of setting env var

# setting function
installersetup() {
	pkg upgrade -y -o Dpkg::Options::="--force-confold"
	pkg install unzip -y
}

dlfile() {
	url="$1"
	curl --retry 10 --retry-delay 2 --retry-all-errors -Lo "DepotDownloader.zip" "$url"
}

ddsetup() {
	unzip -j DepotDownloader.zip "DepotDownloader" -d "$PREFIX"/bin/
	rm DepotDownloader.zip
	chmod +x "$PREFIX"/bin/DepotDownloader
}
# end of setting function

if [ "$arch" = "x86_64" ]; then
	echo "X86_64 Architecture"
	installersetup
	dlfile "https://github.com/TheKingFireS/TermuxDepotDownloader/releases/download/"
elif [ "$arch" = "arm" ]; then
	echo "ARM32 Architecture"
	installersetup
	dlfile "https://github.com/TheKingFireS/TermuxDepotDownloader/releases/download/"
elif [ "$arch" = "aarch64" ]; then
	echo "ARM64 Architecture"
	installersetup
	dlfile "https://github.com/TheKingFireS/TermuxDepotDownloader/releases/download/"
else
	echo "Unsupported ""$arch"" architecture detected, exiting..."
	exit 1
fi
ddsetup
exit 0
