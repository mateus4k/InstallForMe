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
    ${green}[ 3 ]${reset} - Mozila Firefox
    ${green}[ 4 ]${reset} - PDF - Presenter Console
    ${green}[ 5 ]${reset} - PSensor
    ${green}[ 6 ]${reset} - Qbittorrent
    ${green}[ 7 ]${reset} - Spotify
    ${green}[ 8 ]${reset} - Stacer
    ${green}[ 9 ]${reset} - Sublime Text
    ${green}[ 10]${reset} - Others tools (gcc, python, vim, unrar, redshift, etc...)
    ${green}[ 11]${reset} - Cisco Packet Tracer 7.1
    ${green}[ 99]${reset} - Manual installation LIKE A BOSS
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
3) firefox ;;
4) pdfpc ;;
5) psensor ;;
6) qbittorrent ;;
7) spotify ;;
8) stacer ;;
9) sublime ;;
10) others ;;
11) packettracer ;;
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

firefox(){
    wget "https://download.mozilla.org/?product=firefox-latest&os=linux&lang=en-US" -O firefox.tar.bz2
    sudo tar -jxvf  firefox.tar.bz2 -C /opt/
    sudo mv /opt/firefox*/ /opt/firefox
    sudo ln -sf /opt/firefox/firefox /usr/bin/firefox
    echo -e '[Desktop Entry]\n Version=46.0.1\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Web Browser\n Exec=/opt/firefox/firefox\n Icon=/opt/firefox/browser/icons/mozicon128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox.desktop
    menu
} #firefox

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

qbittorrent(){
    sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
    sudo apt-get update
    sudo apt-get install qbittorrent
    menu
} #qbittorrent

spotify(){
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install spotify-client
    menu
} #spotify

stacer(){
    wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.8/stacer_1.0.8_amd64.deb -O stacer.deb
    sudo dpkg -i stacer.deb
    menu
} #stacer

sublime(){
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
    menu
} #sublime

# git, gcc, gdebi, python, vim and screenfetch
others(){
    sudo apt install gedit gcc gdebi python2.7 python3 vim screenfetch unrar redshift-gtk ttf-mscorefonts-installer
    sudo fc-cache
    menu
} #others

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

manual(){
    echo "Enter the program you want to install (Maybe he's not in the repository...): "
    read program
    sudo apt-get install $program
    menu
} #manual
menu
