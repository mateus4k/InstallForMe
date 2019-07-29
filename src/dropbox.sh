#!/bin/bash

echo -ne "${arrowOk}Do you use ${red}Nautilus${reset} or ${blue}others${reset}? "
read drop

if [ "$drop" = "Nautilus" ] || [ "$drop" = "nautilus" ]; then
    sudo apt-get install -y nautilus-dropbox
else
    cd ~ && wget -qO - "https://www.dropbox.com/download?plat=lnx.x86_64" --show-progress | tar xzf -
    ~/.dropbox-dist/dropboxd &
fi
echo -e "${clean}~/.dropbox-dist/dropboxdi to run dropbox"
menu
