

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

Press enter for select "Mirror group".

Press arrow keys and press spacebar for select continent that you're currently living in.

Try again run ``./installproot.sh``

## Using of DepotDownloader
**Exemple:** ``depotdownloader -username user -password 1234 -app 220 -depot 221 -dir HL2 -validate``

(Note) Special characters need quote in password, e.g: ``-password 'wowap@$$word!!'``

(Must do) ``-app 220`` is a specifying AppID of Half-Life 2 game.

(Optional) ``-depot 221`` is a specifying DepotID of Half-Life 2 Base.

For more info, look up app in steamdb.info.

(Optional) ``-dir HL2`` is where directory to download.

(Must do) ``-validate`` is include checksum verification of files already downloaded.

**DepotDownloader:** Downloading game (remove <>)
```bash
depotdownloader -username <Steam Username> -password <Steam Password> -app APPID -depot DEPOTID -dir FOLDERNAME -validate
```
**Workaround for errors:**

If you have that error ``Error: -app not specified!``, then run this command instead.
```bash
depotdownloader -app APPID -depot DEPOTID -dir FOLDERNAME -validate -username <Steam Username> -password <Steam Password>
```
For some reason, Termux on some devices has issue reading ability

Please post issue if you find another error.
