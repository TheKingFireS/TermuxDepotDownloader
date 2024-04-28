

## Install Termux from Github or F-Droid to replace outdated Google Play Store version
 - Github(choose the right architecture or use ``universal``): https://github.com/termux/termux-app/releases/latest
 - F-Droid: https://f-droid.org/en/packages/com.termux
## Download and run a script for Termux.
```bash
curl -LO "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotDownloader/alpine/installproot.sh"
chmod +x installproot.sh
./installproot.sh
```
### If you get error during ./installproot.sh (Use termux-change-repo for...)

Run that command ``termux-change-repo``

Press enter for select "Main repository".

Press down and press spacebar for select "Mirrors by A1batross".

Try again run ``./installproot.sh``
## Login into the PRoot Alpine, downloading and running the DepotDownloader
```bash
proot-distro login alpine
```
### Now, downloading and running the DepotDownloader script.
```bash
wget "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotDownloader/alpine/installdepotdownloader.sh"
chmod +x installdepotdownloader.sh
./installdepotdownloader.sh
```
## Using of DepotDownloader
### Now, enter the depotdownloader directory by run that command
```bash
cd depotdownloader
```
**Exemple:** ``dotnet DepotDownloader.dll -username user -password 1234 -app 220 -depot 221 -dir HL2 -validate``

(Note) Special characters need quote in password, e.g: ``-password "p@$$word"``

(Must do) ``-app 220`` is a specifying AppID of Half-Life 2 game.

(Optional) ``-depot 221`` is a specifying DepotID of Half-Life 2 Base.

For more info, look up app in steamdb.info.

(Optional) ``-dir HL2`` is where directory to download.

(Must do) ``-validate`` is include checksum verification of files already downloaded.

**DepotDownloader:** Downloading game(remove <>)
```bash
dotnet DepotDownloader.dll -username <Steam Username> -password <Steam Password> -remember-password -app APPID -depot DEPOTID -dir FOLDERNAME -validate
```
**Workaround for errors:**

If you get that error ``Failed to create CoreCLR, HRESULT: 0x80004005`` while executing DepotDownloader. (Don't copy it all, only ``export ...`` part)
```bash
nano /etc/profile
#Then add that text to profile
export COMPlus_EnableDiagnostics=0
```
After done edit file, save and close file in Nano:
First, press CTRL+o, then press Enter and last, press CTRL+x.

If you have that error ``Error: -app not specified!``, then run this command instead.
```bash
dotnet DepotDownloader.dll -app APPID -depot DEPOTID -dir FOLDERNAME -validate -username <Steam Username> -password <Steam Password> -remember-password
```
For some reason, Termux on some devices has issue reading ability

Please post issue if you find another error.

## Opening PRoot directory using Android file manager.
Android file manager is notorious for slowest copying when it come to heavy folders. You must compress folder.

**To compress folder.** You can change file name, but don't change file extension(.tar.gz)!

You must change Folders name to something else you named it in ``-dir...``

```bash
tar czvf AnyNames.tar.gz Folders
```
(Optional): remove unnecessary folders to free up storage space.
```bash
rm -rfv folder/ folder2/ folder3/ file file2
```

**To open Android file manager**

Marc apps & software's Files: https://play.google.com/store/apps/details?id=com.marc.files

click hamburger or 3 horizontal lines icon

click Termux with Termux icon

You should see folder named ``droot``
