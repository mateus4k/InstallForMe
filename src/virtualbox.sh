#!/bin/bash

echo "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/oracle-virtualbox-bionic.list

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt-get -y update
sudo apt-get -y install virtualbox-6.0

menu
