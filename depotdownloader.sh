#!/data/data/com.termux/files/usr/bin/env sh
#WIP
#setting env
username="user"
print_green() {
	#Bold bright green
	printf "\033[1;92m%s\033[0m\n" "$1"
}
print_red() {
	#Bold red
	printf "\033[1;31m%s\033[0m\n" "$1"
}
#end of setting env
proot-distro login alpine --user $username --shared-tmp -- ash -c "cd /storage/emulated/0/Download/depotdownloaded && DepotDownloader \"\$@\"" -- "$@"
if [ $? -eq 0 ]; then
	if [ "$#" -ne 0 ]; then
		print_green "Download finished! Check the 'Downloads/depotdownloaded' folder in your file manager app."
	fi
else
	print_red "Failed"
fi
