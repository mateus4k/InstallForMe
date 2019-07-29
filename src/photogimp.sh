#!/bin/bash

#install gimp
sudo apt-get install -y gimp

#backuping GIMP old data
gimp_bkp="$HOME/.gimp-2.8"

if [ -d "${gimp_bkp}" ]; then
    echo -e "${arrowOk}Creating GIMP data backup"
    sudo mv "${gimp_bkp}" "$HOME/.gimp-2.8.old"
    echo -e "${arrowOk}Sucessfull! Your GIMP backup is in ${yellow}$HOME/.gimp-2.8.old${reset}"
fi

#downloading photogimp
echo -e "${arrowOk}Downloading PhotoGIMP!"
wget -q "https://github.com/mateus4k/InstallForMe/blob/photogimp/gimp-2.8.tar.bz2?raw=true" -O "$HOME/gimp-2.8.tar.bz2" --show-progress
cd $HOME
tar -xjvf gimp-2.8.tar.bz2
sudo rm -rf gimp-2.8.tar.bz2
echo -e "${arrowOk}Sucessfull! Your new GIMP config is in ${yellow}$HOME/.gimp-2.8${reset}"
menu
