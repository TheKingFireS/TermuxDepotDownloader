#!/data/data/com.termux/files/usr/bin/env sh
#WIP
#setting env
username="user"
print_green() {
	#Bold bright green
	printf "\033[1;92m$1\033[0m\n"
}
print_red() {
	#Bold red
	printf "\033[1;31m$1\033[0m\n"
}
#end of setting env
proot-distro login alpine --user $username --bind "$HOME"/storage/downloads/depotdownloaded:/home/$username --shared-tmp -- DepotDownloader "$@"
if [ $? -eq 0 ]; then
	print_green "Download finished! Check the 'Downloads/depotdownloaded' folder in your file manager app."
else
	print_red "Failed"
fi
