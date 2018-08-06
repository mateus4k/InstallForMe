#!/bin/bash
clear

#colors
red='\033[1;31m'
yellow='\033[1;33m'
reset='\033[01;37m'

echo -e "${red}==============================================${reset}"
echo -e "${red}====${reset}    INSTALL    ${red}===========================${reset}"
echo -e "${red}=============${reset}    FOR    ${red}======================${reset}"
echo -e "${red}==================${reset}    ME    ${red}==================${reset}"
menu(){
    echo -e "${red}==============================================${reset}

    ${yellow}This script contains these installers:${reset}
    ${red}>>${reset}  1   - Dropbox (Nautilus)
    ${red}>>${reset}  2   - ffmpeg
    ${red}>>${reset}  3   - PDF - Presenter Console
    ${red}>>${reset}  4   - PSensor
    ${red}>>${reset}  5   - Spotify
    ${red}>>${reset}  6   - Sublime Text
    ${red}>>${reset}  7   - Cisco Packet Tracer 7.1
    ${red}>>${reset}  8   - Oh-My-Zsh
    ${red}>>${reset}  9   - NodeJS
    ${red}>>${reset}  10  - Google Chrome
    ${red}>>${reset}  11  - Virtual Box 5.2
    ${red}>>${reset}  12  - F.lux
    ${red}>>${reset}  88  - Others tools (git, vim, unrar, etc...)
    ${red}>>${reset}  99  - Manual installation
    ${red}>>${reset}  100 - Update All
    ${red}>>${reset}  0   - Exit

${red}==============================================${reset}"
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
8) zsh ;;
9) nodejs ;;
10) chrome ;;
11) vb ;;
12) flux ;;
88) others ;;
99) manual ;;
100) update ;;
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
    sudo apt-get install -y spotify-client
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

zsh(){
    sudo apt install curl fonts-powerline zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sudo chsh -s $(which zsh)
    echo "Please add 'zsh-autosuggestions' to .zshrc in plugins and change theme do 'agnoster'"
    menu
} #zsh

nodejs(){
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo apt-get install npm
    menu
} #nodejs

chrome(){
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb; sudo dpkg -i chrome.deb; rm -f chrome.deb
    menu
} #chrome

vb(){
    sudo apt-get update
    sudo apt-get install virtualbox-5.2
    menu
} #vb

flux(){
    sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
    sudo apt-get update
    sudo apt-get -y install fluxgui git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1 #f.lux + dependencies for Ubuntu/Debian
    menu
} #flux

others(){
    sudo apt install gedit gdebi python3 vim screenfetch unrar ttf-mscorefonts-installer transmission
    sudo fc-cache
    menu
} #others

manual(){
    echo 'Enter the program that you wanna install [Ex.: "sqlite3"]'
    echo "(Maybe it isn't in the local repository...): "
    read program
    sudo apt-get install $program
    menu
} #manual

update(){
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    menu
} #update
menu
