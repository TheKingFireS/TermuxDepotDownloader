#!/data/data/com.termux/files/usr/bin/sh
# Download and install proot debian
pkg upgrade -y 
pkg install proot-distro -y
proot-distro install debian
