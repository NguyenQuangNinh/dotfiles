#!/bin/bash
echo "Current User: $USER"
wget https://raw.githubusercontent.com/NguyenQuangNinh/dotfiles/master/initialize.sh
sudo bash initialize.sh $USER
sudo rm -f initialize.sh
