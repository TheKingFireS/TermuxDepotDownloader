
## Install Termux from Github or F-droid to replace outdated Google Play Store version
 - Github(choose the right architecture or use ``universal``): https://github.com/termux/termux-app/releases/latest
 - F-Droid: https://f-droid.org/en/packages/com.termux
## Download and run script for Termux.
```bash
curl "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotdownloader/main/installproot.sh" -o installproot.sh
chmod +x installproot.sh
./installproot.sh
```
## Run the PRoot debian, download and run Depotdownloader
```bash
proot-distro login debian
```
Now, download and run the Depotdownloader script for ARM 64bit devices.
```bash
curl "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotdownloader/main/installdepotdownloader64.sh" -o installdepotdownloader64.sh
chmod +x installdepotdownloader64.sh
./installdepotdownloader64.sh
```
or for ARM 32bit devices.
```bash
curl "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotdownloader/main/installdepotdownloader32.sh" -o installdepotdownloader32.sh
chmod +x installdepotdownloader32.sh
./installdepotdownloader32.sh
```
## Using of Depotdownloader
**DepotDownloader:** Downloading game(remove <>)
```bash
../dotnet/dotnet DepotDownloader.dll -username <Steam Username> -password <Steam Password> -remember-password -app APPID -depot RESOURCESDEPOT
```
