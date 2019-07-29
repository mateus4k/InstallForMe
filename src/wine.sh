#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'
sudo apt-get -y update
sudo apt-get install --install-recommends winehq-stable
menu
