#!/bin/bash

wget -q https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb --show-progress
sudo dpkg -i vscode.deb
rm -rf vscode.deb
menu
