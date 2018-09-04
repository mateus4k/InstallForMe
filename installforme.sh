#!/bin/bash
clear

#colors
red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
yellow='\033[1;33m'
reset='\e[0m'
bold='\033[01;37m'
txtstyle='    \033[1;31m>>\e[0m  '

echo -e "${red}=============== ${bold}INSTALL FOR ME ${red}===============${reset}"
menu(){
  echo -e "${red}==============================================${reset}
${yellow}>> Software List:${reset}
${txtstyle}1   - Dropbox (Nautilus)
${txtstyle}2   - ffmpeg
${txtstyle}3   - PDF - Presenter Console
${txtstyle}4   - PSensor
${txtstyle}5   - Spotify
${txtstyle}6   - Sublime Text
${txtstyle}7   - Cisco Packet Tracer 7.1
${txtstyle}8   - Oh-My-Zsh
${txtstyle}9   - NodeJS
${txtstyle}10  - Google Chrome
${txtstyle}11  - Virtual Box 5.2
${txtstyle}12  - F.lux
${txtstyle}13  - Arc Theme & Icons
${txtstyle}14  - PhotoGIMP by Diolinux
${txtstyle}88  - Others tools (git, vim, unrar, etc...)
${txtstyle}99  - Manual installation
${txtstyle}100 - Update All
${txtstyle}0   - Exit
${red}==============================================${reset}"
    sleep 0.5
    echo -ne "${yellow}>> YOUR CHOISE: ${reset}"
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
13) arc ;;
14) photogimp ;;
88) others ;;
99) manual ;;
100) update ;;
0)  echo "${txtstyle}Exiting..."
    sleep 1
    exit ;;
*) echo "${txtstyle}Unknown option..."
   echo "${txtstyle}Returning to menu..."
   sleep 2
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
    echo "${txtstyle}Please add 'zsh-autosuggestions' to ${red}.zshrc${reset} in plugins and change theme to ${red}'agnoster'${reset}"
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

arc(){
    sudo add-apt-repository -y ppa:noobslab/themes
    sudo add-apt-repository -y ppa:noobslab/icons
    sudo apt-get update
    sudo apt-get install arc-theme arc-icons

    #menu icon
    echo
    echo -e "${txtstyle}Choose a menu icon color:"
    echo -ne "${txtstyle}${green}[green]${reset}/${blue}[blue]${reset}: "
    read color

    if [ "$color" = "green" ]; then
	echo -e "${txtstyle}Downloading..."
	wget -qO logo_green.png https://i.imgur.com/ui51P3J.png;
	sudo mv logo_green.png /home/$USER/Pictures/;
	echo -e "${txtstyle}Sucessfull! Your file is in ${yellow}/home/$USER/Pictures/${reset}";

    elif [ "$color" = "blue" ]; then
	echo -e "${txtstyle}Downloading..."
	wget -qO logo_blue.png https://i.imgur.com/Q8dlRjt.png;
	echo -e "${txtstyle}Sucessfull! Your file is in ${yellow}/home/$USER/Pictures/${reset}";
	sudo mv logo_blue.png /home/$USER/Pictures/;

    else
	echo -e "${txtstyle}Invalid option!";
	sleep 2.5
    fi
menu
} #arc

photogimp(){
    #install gimp    
    sudo apt-get install gimp    

    #backuping GIMP old data
    gimp_bkp="/home/${USER}/.gimp-2.8"

    if [ -d "${gimp_bkp}" ]; then
	echo -e "${txtstyle}Creating GIMP data backup"
	sudo mv "${gimp_bkp}" "/home/${USER}/.gimp-2.8.old"
	echo -e "${txtstyle}Sucessfull! Your GIMP backup is in ${yellow}/home/$USER/.gimp-2.8.old${reset}";
    fi
    
    #downloading photogimp
    echo -e "${txtstyle}Downloading PhotoGIMP!"
    wget -q "https://github.com/mateus4k/InstallForMe/blob/photogimp/gimp-2.8.tar.bz2?raw=true" -O "/home/$USER/gimp-2.8.tar.bz2" --show-progress
    cd /home/$USER
    tar -xjvf gimp-2.8.tar.bz2
    sudo rm -rf gimp-2.8.tar.bz2
    echo -e "${txtstyle}Sucessfull! Your new GIMP config is in ${yellow}/home/$USER/.gimp-2.8${reset}"
    menu
} #photogimp

others(){
    sudo apt install gedit gdebi python3 vim screenfetch unrar ttf-mscorefonts-installer transmission
    sudo fc-cache
    menu
} #others

manual(){
    echo -e "${txtstyle}Enter the program that you wanna install [Ex.: ${red}sqlite3{$reset}]"
    echo -ne "${txtstyle}(Maybe it isn't in the local repository...): "
    read program
    sudo apt-get install -y $program
    menu
} #manual

update(){
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean
    menu
} #update
menu
