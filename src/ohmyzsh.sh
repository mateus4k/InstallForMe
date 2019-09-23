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

# install zsh config file
sudo cp src/zshrc ~/.zshrc

# for root
sudo usermod -s $(which zsh) root

# for current user
sudo usermod -s $(which zsh) ${USER}

# spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# dracula colorscheme for Gnome Terminal
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
cd gnome-terminal-colors-dracula
./install.sh
sudo rm -rf gnome-terminal-colors-dracula

menu
