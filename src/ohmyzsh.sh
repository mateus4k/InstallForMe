#!/bin/bash

# delete old files
sudo rm -rf ~/.oh-my-zsh

# install packages
sudo apt install -y zsh dconf-cli fonts-powerline

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

# syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# dracula theme
git clone https://github.com/dracula/zsh.git dracula
sudo mv dracula/dracula.zsh-theme ~/.oh-my-zsh/themes/
mkdir ~/.oh-my-zsh/themes/lib/
sudo mv dracula/lib/* ~/.oh-my-zsh/themes/lib/
rm -rf dracula

# install zsh config file
sudo cp zshrc ~/.zshrc

# for root
sudo usermod -s $(which zsh) root

# for current user
sudo usermod -s $(which zsh) ${USER}

# dracula colorscheme for Gnome Terminal
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
cd gnome-terminal-colors-dracula
./install.sh

menu
