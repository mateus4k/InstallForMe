#!/bin/bash
clear

#colors
red='\033[1;31m'
yellow='\033[1;33m'
green='\033[01;32m'
reset='\033[01;37m'

echo -e "${green}==============================================${reset}"
echo -e "${green}====${reset}    INSTALL    ${green}===========================${reset}"
echo -e "${green}=============${reset}    FOR    ${green}======================${reset}"
echo -e "${green}==================${reset}    ME    ${green}==================${reset}"
echo -e "${green}=======${reset}      github.com/mateus4k      ${green}========${reset}"
menu(){
    echo -e "${green}==============================================${reset}

    ${yellow}This script contains these installers:${reset}
    ${green}[ 1 ]${reset} - Dropbox (Nautilus)
    ${green}[ 2 ]${reset} - ffmpeg
    ${green}[ 3 ]${reset} - PDF - Presenter Console
    ${green}[ 4 ]${reset} - PSensor
    ${green}[ 5 ]${reset} - Spotify
    ${green}[ 6 ]${reset} - Sublime Text
    ${green}[ 7 ]${reset} - Cisco Packet Tracer 7.1
    ${green}[ 8 ]${reset} - Others tools (git, vim, unrar, redshift, etc...)
    ${green}[ 99]${reset} - Manual installation
    ${green}[ 0 ]${reset} - Exit

${green}==============================================${reset}"
    sleep 0.5
    echo -ne "${yellow}-> YOUR CHOISE: ${reset}"
    read choise

#sudo permission
login(){
    echo "[sudo] password for $USER: "
    passwd $username
} #sudo

case $choise in
1) dropbox ;;
2) ffmpeg ;;
3) pdfpc ;;
4) psensor ;;
5) spotify ;;
6) sublime ;;
7) packettracer ;;
8) others ;;
99) manual ;;
0)  echo "Exiting..."
    sleep 1
    exit ;;
*) echo "Unknown option..."
   echo "Returning to menu..."
   sleep 2.5
   menu ;;
esac
} #menu

#voids
dropbox(){
    sudo apt-get install nautilus-dropbox
    menu
} #dropbox

ffmpeg(){
    sudo apt-add-repository ppa:jonathonf/ffmpeg-3
    sudo apt-get update
    sudo apt-get install ffmpeg
    menu
} #ffmpeg

pdfpc(){
    sudo apt-get install pdf-presenter-console
    menu
} #pdfpc

psensor(){
    sudo apt-get install lm-sensors
    sudo sensors-detect
    sudo apt-get install psensor  
    menu
} #pfsensor

spotify(){
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install spotify-client
    menu
} #spotify

sublime(){
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
    menu
} #sublime

packettracer(){
    cd
    mkdir ciscopacket
    cd ciscopacket
    wget -c http://www.labcisco.com.br/app/Cisco-PT-71-x64.tar.gz -O ciscopacket.tar.gz
    sleep 1
    tar -xzvf ciscopacket.tar.gz
    sudo ./install
    cd
    menu
} #packettracer

others(){
    sudo apt install gdebi git python3 vim screenfetch unrar redshift-gtk ttf-mscorefonts-installer fonts-powerline
    sudo fc-cache
    menu
} #others

manual(){
    echo "Enter the program you want to install (Maybe he's not in the repository...): "
    read program
    sudo apt-get install $program
    menu
} #manual
menu
