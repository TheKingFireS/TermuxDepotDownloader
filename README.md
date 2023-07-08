
## Install Termux from Github or F-Droid to replace outdated Google Play Store version
 - Github(choose the right architecture or use ``universal``): https://github.com/termux/termux-app/releases/latest
 - F-Droid: https://f-droid.org/en/packages/com.termux
## Download and run a script for Termux.
```bash
curl -LO "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotDownloader/main/installproot.sh"
chmod +x installproot.sh
./installproot.sh
```
**If you get error during ./installproot.sh (Use termux-change-repo for...)**

Run that command ``termux-change-repo``

Press enter for select "Main repository".

Press down and press spacebar for select "Mirrors by A1batross".

Try again run ``./installproot.sh``

**If you get paused by that message "Configuration file '/data/data...."**

Just press enter at everything else.
## Login into the PRoot Debian, downloading and running the DepotDownloader
```bash
proot-distro login debian
```
**Now, downloading and running the DepotDownloader script.**
```bash
curl -LO "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotDownloader/main/installdepotdownloader.sh"
chmod +x installdepotdownloader.sh
./installdepotdownloader.sh
```
## Using of DepotDownloader
**Now, enter the depotdownloader directory by run that command**
```bash
cd depotdownloader
```
**Exemple:** ``./DepotDownloader -username user -password 1234 -app 220 -depot 221 -dir HL2 -validate``

App 220 is Half-Life 2 game.

Depot 221 is Half-Life 2 Base.

For more info, look up app in steamdb.info.

-dir HL2 is where directory to download.

-validate is include checksum verification of files already downloaded.

**DepotDownloader:** Downloading game(remove <>)
```bash
./DepotDownloader -username <Steam Username> -password <Steam Password> -remember-password -app APPID -depot DEPOTID -dir FOLDERNAME -validate
```
**Workaround for errors:**

If you have that error ``Error: -app not specified!``, then run this command instead.
```bash
./DepotDownloader -app APPID -depot DEPOTID -dir FOLDERNAME -validate -username <Steam Username> -password <Steam Password> -remember-password
```
For some reason, Termux on some devices has issue reading ability

Please post issue if you find another error.

## Opening PRoot directory using Android file manager.
Android file manager is notorious for slowest copying when it come to heavy folders. You must compress folder.

**To compress folder.** You can change file name and folders name, but don't change file extension(.tar.gz)!

```bash
tar czvf AnyNames.tar.gz Folders
```
(Optional): remove unnecessary folders to free up storage space.
```bash
rm -rf folder/ folder2/ folder3/ file file2
```

**To open Android file manager**

Marc apps & software's Files: https://play.google.com/store/apps/details?id=com.marc.files

click hamburger icon

click Termux with Termux icon

You should see folder named ``droot``
