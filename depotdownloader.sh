#!/data/data/com.termux/files/usr/bin/env sh
# WIP
# setting env var
username="user"
installed_rootfs="$PREFIX/var/lib/proot-distro/containers/alpine/rootfs"
IsolatedStorage="$installed_rootfs/home/user/.local/share/IsolatedStorage"

# SET_DIR: will only work if you provided path from proot and not Termux. Yes, full path.
SET_DIR="${SET_DIR:-/storage/emulated/0/Download/depotdownloaded}"

# language strings
LANG_SUCCESS_DOWNLOAD="${LANG_SUCCESS_DOWNLOAD:-Download finished! Check the '${SET_DIR#/storage/emulated/0/}' folder in your file manager app.}"
LANG_FAILED="${LANG_FAILED:-Failed}"
# end of setting env var

# setting function
print_green() {
	# Bold bright green
	printf "\033[1;92m%s\033[0m\n" "$1"
}
print_red() {
	# Bold red
	printf "\033[1;31m%s\033[0m\n" "$1"
}
# end of setting function

# custom parameters
# clear
if [ "$1" = "rmis" ]; then
	if [ -d "$IsolatedStorage" ]; then
		rm -r "$IsolatedStorage"
		print_green "Successfully cleared Depotdownloader data"
	else
		print_red "There's nothing to clear"
		exit 1
	fi

	exit 0
fi
# end of custom parameters

# wrap DepotDownloader
proot-distro login alpine --user $username --shared-tmp -- ash -lc "cd \"$SET_DIR\" && DepotDownloader \"\$@\"" -- "$@"
if [ $? -eq 0 ]; then
	if [ "$#" -ne 0 ] && ! echo "$@" | grep -qE '(^|\s)(-V|--version)($|\s)'; then
		print_green "$LANG_SUCCESS_DOWNLOAD"
	fi
else
	print_red "$LANG_FAILED"
fi
