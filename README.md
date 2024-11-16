

## Install Termux from Github or F-Droid to replace outdated Google Play Store version
 - Github(choose the right architecture or use `universal`): https://github.com/termux/termux-app/releases/latest
 - F-Droid: https://f-droid.org/en/packages/com.termux
## Download and run a script for Termux.
```bash
curl -LO "https://raw.githubusercontent.com/TheKingFireS/TermuxDepotDownloader/native/installdepotdownloader.sh"
chmod +x installdepotdownloader.sh
./installdepotdownloader.sh
```
### If you get error during ./installproot.sh (Use termux-change-repo for...)

Run that command `termux-change-repo`

Press enter for select "Mirror group".

Press arrow keys and press spacebar for select continent that you're currently living in.

Try again run `./installdepotdownloader.sh`
## Using of DepotDownloader
**Exemple:** `DepotDownloader -username user -password 1234 -remember-password -app 220 -beta steam_legacy -depot 221 -dir HL2 -validate`

(Note) Special characters need quote in password, e.g: `-password 'wowap@$$word!!'`

(Optional) `-remember-password` is like "Remember me" feature, you can use your account in next session without having to accept notification from your Steam Guard. Also keep that argument line in next session.

(Must do) `-app 220` is specifying AppID of Half-Life 2 game.

(Depending on some games) `-beta steam_legacy` is specifiying steam_legacy branch of HL2 to download, this allow to download previous build of HL2 instead of latest. Required this time.

(Optional) `-depot 221` is a specifying DepotID of Half-Life 2 Base.

For more info, look up app in steamdb.info.

(Optional) `-dir HL2` is where directory to download.

(Must do) `-validate` is include checksum verification of files already downloaded.

For more information about DepotDownloader, check out SteamRE's [Depotdownloader repo](https://github.com/SteamRE/DepotDownloader).

**DepotDownloader:** Downloading game (remove <>)
```bash
DepotDownloader -username <Steam Username> -password <Steam Password> -remember-password -app APPID -depot DEPOTID -dir FOLDERNAME -validate
```
**Workaround for errors:**

If you have that error `Error: -app not specified!`, then run this command instead.
```bash
DepotDownloader -app APPID -depot DEPOTID -dir FOLDERNAME -validate -username <Steam Username> -password <Steam Password> -remember-password
```
For some reason, Termux on some devices has issue reading ability

Please post issue if you find another error.
