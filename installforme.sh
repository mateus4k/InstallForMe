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
    ${red}[ 1 ]${reset} - Dropbox (Nautilus)
    ${red}[ 2 ]${reset} - ffmpeg
    ${red}[ 3 ]${reset} - PDF - Presenter Console
    ${red}[ 4 ]${reset} - PSensor
    ${red}[ 5 ]${reset} - Spotify
    ${red}[ 6 ]${reset} - Sublime Text
    ${red}[ 7 ]${reset} - Cisco Packet Tracer 7.1
    ${red}[ 8 ]${reset} - Oh-My-Zsh
    ${red}[ 9 ]${reset} - Others tools (git, vim, unrar, etc...)
    ${red}[ 99]${reset} - Manual installation
    ${red}[ 0 ]${reset} - Exit

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
9) others ;;
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

zsh(){
    sudo apt install curl fonts-powerline zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sudo chsh -s $(which zsh)
    echo "Please add 'zsh-autosuggestions' to .zshrc in plugins and change theme do 'agnoster'"
    menu
} #zsh

others(){
     sudo apt install gedit gdebi git python3 vim screenfetch unrar redshift-gtk ttf-mscorefonts-installer 
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
