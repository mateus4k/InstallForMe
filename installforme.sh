#!/bin/bash
clear

#colors
red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
yellow='\033[1;33m'
reset='\e[0m'
txtstyle='  \033[1;31m>>\e[0m  '

# header and menu
echo -e "${red}============ ${bold}INSTALL FOR ME ${red}============${reset}"
menu(){
    echo -e "${red}========================================${reset}
${yellow}>> Software List${reset}
${txtstyle}1   - Dropbox
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
${txtstyle}13  - Redshift
${txtstyle}14  - Arc Theme & Icons
${txtstyle}15  - PhotoGIMP by Diolinux
${txtstyle}16  - Visual Studio Code
${txtstyle}17  - Telegram Desktop
${txtstyle}18  - Xampp
${txtstyle}99  - Others (vim, unrar, etc...)
${txtstyle}100 - Update All
${txtstyle}0   - Exit
${red}========================================${reset}"
    
    sleep 0.5
    echo -ne "${yellow}>> YOUR CHOISE: ${reset}"
    read choise

    #sudo permission
    login(){
        echo "[sudo] password for $USER: "
        passwd $username
    }

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
    13) redshift ;;
    14) arc ;;
    15) photogimp ;;
    16) vscode ;;
    17) telegram ;;
    18) xampp ;;
    99) others ;;
    100) update ;;
    0) echo -e "${txtstyle}Exiting..."
       sleep 1
       exit ;;
    *) echo -e "${txtstyle}Unknown option..."
       echo -e "${txtstyle}Returning to menu..."
       sleep 2
       menu ;;
    esac
}

dropbox(){
    echo -ne "${txtstyle}Do you use ${red}Nautilus${reset} or ${blue}others${reset}? "
    read drop

    if [ "$drop" = "Nautilus" ] || [ "$drop" = "nautilus" ]; then
	sudo apt-get install -y nautilus-dropbox	
    else
	cd ~ &&  wget -qO - "https://www.dropbox.com/download?plat=lnx.x86_64" --show-progress | tar xzf -; ~/.dropbox-dist/dropboxd &
    fi
    echo -e "${txtstyle}~/.dropbox-dist/dropboxdi${reset} to run dropbox";
    menu
}

ffmpeg(){
    sudo apt-add-repository ppa:jonathonf/ffmpeg-3
    sudo apt-get update
    sudo apt-get install -y ffmpeg
    menu
}

pdfpc(){
    sudo apt-get install -y  pdf-presenter-console
    menu
}

psensor(){
    sudo apt-get install -y lm-sensors
    sudo sensors-detect
    sudo apt-get install -y psensor  
    menu
}

spotify(){
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install -y spotify-client
    menu
}

sublime(){
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install -y apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install -y sublime-text
    menu
}

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
}

zsh(){
    sudo apt install -y zsh

    # delete old files
    sudo rm -rf ~/.oh-my-zsh

    # download oh-my-zsh
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 

    # download plugin autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    
    # install agnoster theme font
    sudo apt install -y fonts-powerline

    # install zsh config file
    sudo cp zshrc ~/.zshrc

    if [ "$SHELL" != "/bin/zsh" ]; then
	# for root
	sudo usermod -s $(which zsh) root 

	# for current user
	sudo usermod -s $(which zsh) ${USER}
    fi
    menu
}

nodejs(){
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs npm
    menu
}

chrome(){
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb; sudo dpkg -i chrome.deb; rm -f chrome.deb
    menu
}

vb(){
    sudo apt-get update
    sudo apt-get install -y virtualbox
    menu
}

flux(){
    sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
    sudo apt-get update
    sudo apt-get -y install -y fluxgui git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1 #f.lux + dependencies for Ubuntu/Debian
    menu
}

redshift(){
    sudo apt-get -y install redshift redshift-gtk
}

arc(){
    sudo add-apt-repository -y ppa:noobslab/themes
    sudo add-apt-repository -y ppa:noobslab/icons
    sudo apt-get update
    sudo apt-get install -y arc-theme arc-icons

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
        sleep 2
    fi
    menu
}

photogimp(){
    #install gimp    
    sudo apt-get install -y gimp    

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
}

vscode(){
    wget -q https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb --show-progress; sudo dpkg -i vscode.deb; rm -rf vscode.deb
    menu
}

telegram(){
    # download telegram desktop	
    wget https://updates.tdesktop.com/tlinux/tsetup.1.4.3.tar.xz -O telegram.tar.xz;

    # uncompress and move the folder
    sudo tar Jxf telegram.tar.xz -C /opt/; sudo mv /opt/Telegram*/ /opt/telegram

    # create a desktop launcher
    sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram
    echo -e '[Desktop Entry]\n Version=1.0\n Exec=/opt/telegram/Telegram\n Icon=Telegram\n Type=Application\n Categories=Application;Network;' | sudo tee /usr/share/applications/telegram.desktop;
    sudo chmod +x /usr/share/applications/telegram.desktop
    cp /usr/share/applications/telegram.desktop ~/Desktop

    # remove the original file
    rm -f telegram.tar.xz
    menu
}

xampp(){
    wget https://ufpr.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.2.12/xampp-linux-x64-7.2.12-0-installer.run -O xampp-installer.run
    chmod +x xampp-installer.run
    echo -e '[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=gksudo /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/icons/world1.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/xampp.desktop
    sudo chmod +x /usr/share/applications/xampp.desktop
    sudo cp /usr/share/applications/xampp.desktop ~/Desktop
    sudo ./xampp-installer.run
    echo -e "${txtsyle}sudo /opt/lampp/lampp start${reset} to run"
    menu
    rm -f ./xampp-installer.run
}

others(){
    sudo apt install -y gedit vim neofetch unrar ttf-mscorefonts-installer transmission synapse
    sudo fc-cache
    menu
}

update(){
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean
    menu
}
menu
