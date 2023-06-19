
## Install Termux from Github or F-droid to replace outdated Google Play Store version
 - Github(choose the right architecture or use ``universal``): https://github.com/termux/termux-app/releases/latest
 - F-Droid: https://f-droid.org/en/packages/com.termux
## Download and run a script for Termux.
```bash
curl "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotdownloader/main/installproot.sh" -o installproot.sh
chmod +x installproot.sh
./installproot.sh
```
**If you get error during ./installproot.sh (Use termux-change-repo for...)**

run that command ``termux-change-repo``

Press enter for select "Main repository".

Press down and press spacebar for select "Mirrors by A1batross".

Try again run ``./installproot.sh``

**If you get paused by that message "Configuration file '/data/data...."**

Just press enter at everything else.
## Run the PRoot Debian, download and run the Depotdownloader
```bash
proot-distro login debian
```
**Now, download and run the Depotdownloader script for ARM 64bit devices.**
```bash
curl "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotdownloader/main/installdepotdownloader64.sh" -o installdepotdownloader64.sh
chmod +x installdepotdownloader64.sh
./installdepotdownloader64.sh
```
**or for ARM 32bit devices.**
```bash
curl "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotdownloader/main/installdepotdownloader32.sh" -o installdepotdownloader32.sh
chmod +x installdepotdownloader32.sh
./installdepotdownloader32.sh
```
## Using of Depotdownloader
**Now, enter the depotdownloader directory by run that command**
```bash
cd depotdownloader
```
**Exemple:** ``./DepotDownloader -username <Steam Username> -password <Steam Password> -app 220 -depot 221 -dir HL2``

App 220 is Half-Life 2 game.

Depot 221 is Half-Life 2 Base.

For more info, look up app in steamdb.info.

-dir HL2 is where directory to download.

**DepotDownloader:** Downloading game(remove <>)
```bash
./DepotDownloader.dll -username <Steam Username> -password <Steam Password> -remember-password -app APPID -depot DEPOTID
```
**Workaround for errors:**

Nothing errors. Please post issue if you find error.

## Create link PRoot directory for Android file manager.
**to exit PRoot**

``exit``

**to create link directory**
```bash
ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/root/ /data/data/com.termux/files/home/droot
```
**to open Android file manager**

Marc apps & software's Files: https://play.google.com/store/apps/details?id=com.marc.files

click hamburger icon

click Termux with Termux icon

You should see folder named ``droot``
