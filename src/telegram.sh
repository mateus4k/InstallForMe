#!/bin/bash

# download telegram desktop
wget https://updates.tdesktop.com/tlinux/tsetup.1.4.3.tar.xz -O telegram.tar.xz

# uncompress and move the folder
sudo tar Jxf telegram.tar.xz -C /opt/
sudo mv /opt/Telegram*/ /opt/telegram

# create a desktop launcher
sudo ln -sf /opt/telegram/Telegram /usr/bin/telegram
echo -e '[Desktop Entry]\n Version=1.0\n Exec=/opt/telegram/Telegram\n Icon=Telegram\n Type=Application\n Categories=Application;Network;' | sudo tee /usr/share/applications/telegram.desktop
sudo chmod +x /usr/share/applications/telegram.desktop
cp /usr/share/applications/telegram.desktop ~/Desktop

# remove the original file
rm -f telegram.tar.xz
menu
