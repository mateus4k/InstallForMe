#!/bin/bash

wget https://ufpr.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.2.12/xampp-linux-x64-7.2.12-0-installer.run -O xampp-installer.run
chmod +x xampp-installer.run
echo -e '[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=gksudo /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/icons/world1.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/xampp.desktop
sudo chmod +x /usr/share/applications/xampp.desktop
sudo cp /usr/share/applications/xampp.desktop ~/Desktop
sudo ./xampp-installer.run
echo -e "${clean}sudo /opt/lampp/lampp start to run"
rm -f ./xampp-installer.run
menu
