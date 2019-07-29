#!/bin/bash

sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:noobslab/icons
sudo apt-get update
sudo apt-get install -y arc-theme arc-icons

#menu icon
echo
echo -e "${arrowOk}Choose a menu icon color:"
echo -ne "${arrowOk}${green}[green]${reset}/${blue}[blue]${reset}: "
read color

if [ "$color" = "green" ]; then
    echo -e "${arrowOk}Downloading..."
    wget -qO logo_green.png https://i.imgur.com/ui51P3J.png
    sudo mv logo_green.png $HOME/Pictures/
    echo -e "${arrowOk}Sucessfull! Your file is in ${yellow}$HOME/Pictures/${reset}"

elif [ "$color" = "blue" ]; then
    echo -e "${arrowOk}Downloading..."
    wget -qO logo_blue.png https://i.imgur.com/Q8dlRjt.png
    echo -e "${arrowOk}Sucessfull! Your file is in ${yellow}$HOME/Pictures/${reset}"
    sudo mv logo_blue.png $HOME/Pictures/

else
    echo -e "${arrowOk}Invalid option!"
    sleep 1
fi
menu
