#!/bin/bash

sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
sudo apt-get update
sudo apt-get -y install -y fluxgui git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1 #f.lux + dependencies for Ubuntu/Debian
menu