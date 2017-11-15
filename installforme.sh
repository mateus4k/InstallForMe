#!/bin/bash
clear
echo "##############################################"
echo "######  INSTALL  #############################"
echo "###############  FOR  ########################"
echo "####################  ME  ####################"
echo "##############################################"
echo "######## Created by: Mateus4k ################"
menu(){
    echo "##############################################

    This script contains these installers:
    1 - Dropbox (Nautilus)
    2 - ffmpeg
    3 - Mozila Firefox
    4 - PDF - Presenter Console
    5 - PFSensor
    6 - Qbittorrent
    7 - Spotify
    8 - Stacer
    9 - Sublime Text
    10 - Others tools (git, gcc, gdebi, python, vim, screenfetch)
    11 - Manual installation LIKE A BOSS
    0 - Exit

##############################################"
    sleep 2
    echo -n "-> YOUR CHOISE: "
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
5) pfsensor ;;
6) qbittorrent ;;
7) spotify ;;
8) stacer ;;
9) sublime ;;
10) others ;;
11) manual ;;
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
    sudo apt-get install git
    git clone https://github.com/dropbox/nautilus-dropbox
    ./configure
    make
    sudo make install
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

pfsensor(){
    sudo apt-get install lm-sensors
    sudo sensors-detect
    sensors #test sensors
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
    sudo apt install git gcc gdebi python2.7 python3 vim screenfetch
    menu
} #others

manual(){
    echo "Enter the program you want to install (Maybe he's not in the repository...): "
    read program
    sudo apt-get install $program
    menu
} #manual
menu
