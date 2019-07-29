#!/bin/bash

# colors
red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
yellow='\033[1;33m'
reset='\e[0m'

arrowOk='\033[1;32m➜ \e[0m'
arrowNot='\033[1;31m➜ \e[0m'
arrowYellow='\033[1;33m➜ \e[0m'
clean='\033[1;32m✔ \e[0m'
dirty='\033[1;33m✗ \e[0m'

# header and menu
echo -e "${red}============ ${reset}INSTALL FOR ME${red} ============${reset}"
menu() {
    echo -e "${red}========================================${reset}

${clean}Software List

Browsers
${arrowOk}1  - Google Chrome

Development
${arrowOk}2 - Visual Studio Code
${arrowOk}3 - NodeJS
${arrowOk}4 - PHP + Composer
${arrowOk}5 - Xampp
${arrowOk}6 - Vim (dotfiles)

Apps
${arrowOk}7 - Dropbox
${arrowOk}8 - Spotify
${arrowOk}9 - Telegram Desktop

Linux
${arrowOk}10 - Oh-My-Zsh
${arrowOk}11 - Virtual Box 6.0
${arrowOk}12 - Wine
${arrowOk}13 - Arc Theme & Icons
${arrowOk}14 - PhotoGIMP by Diolinux
${arrowOk}15 - F.lux
${arrowOk}16 - Redshift

Others
${arrowOk}17 - Others (gedit, unrar, etc...)
${arrowOk}99 - Update All
${arrowOk}0  - Exit
${red}========================================${reset}"
    echo -ne "${arrowYellow}YOUR CHOISE: "
    read choise

    #sudo permission
    login() {
        echo "[sudo] password for $USER: "
        passwd $username
    }

    case $choise in

    1) source src/chrome.sh ;;
    2) source src/vscode.sh ;;
    3) source src/nodejs.sh ;;
    4) source src/php.sh ;;
    5) source src/xampp.sh ;;
    6) source src/vim.sh ;;
    7) source src/dropbox.sh ;;
    8) source src/spotify.sh ;;
    9) source src/telegram.sh ;;
    10) source src/ohmyzsh.sh ;;
    11) source src/virtualbox.sh ;;
    12) source src/wine.sh ;;
    13) source src/arc.sh ;;
    14) source src/photogimp.sh ;;
    15) source src/flux.sh ;;
    16) source src/redshift.sh ;;
    17) source src/others.sh ;;
    99) source src/update.sh ;;
    0)
        echo -e "${clean}Exiting..."
        exit
        ;;
    *)
        echo -e "${dirty}Unknown option..."
        echo -e "${dirty}Returning to menu..."
        sleep 1
        menu
        ;;
    esac
}

menu
