#!/data/data/com.termux/files/usr/bin/env sh
#WIP
username="user"
proot-distro login debian --user $username --bind $HOME/storage/downloads/depotdownloaded:/home/$username --shared-tmp -- DepotDownloader "$@" || exit
rm -rf $HOME/storage/downloads/depotdownloaded/.local
