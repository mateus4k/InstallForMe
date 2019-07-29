#!/bin/bash

sudo apt install -y zsh

# delete old files
sudo rm -rf ~/.oh-my-zsh

# download oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# download autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

# download syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# download dracula theme
git clone https://github.com/dracula/zsh.git dracula
sudo mv dracula/dracula.zsh-theme ~/.oh-my-zsh/themes/
mkdir ~/.oh-my-zsh/themes/lib/
sudo mv dracula/lib/* ~/.oh-my-zsh/themes/lib/
rm -rf dracula

# install agnoster theme font
sudo apt install -y fonts-powerline

# install zsh config file
sudo cp zshrc ~/.zshrc

# for root
sudo usermod -s $(which zsh) root

# for current user
sudo usermod -s $(which zsh) ${USER}

menu
