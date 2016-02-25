#!/bin/bash

# Add Sublime Text PPA (-y for unattended process)
sudo apt-add-repository -y ppa:webupd8team/sublime-text-3

#Google Chrome
sudo apt-add-repository -y 'deb http://dl.google.com/linux/chrome/deb/ stable main'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Update all repo
sudo apt-get update

# Install neccessary packages:
sudo apt-get install git subversion meld ubuntu-restricted-extras

# Install Google Chrome
sudo apt-get install google-chrome-stable

# Install Sublime Text
sudo apt-get install sublime-text-installer

cd ~/Desktop
git clone https://github.com/NguyenQuangNinh/dotfiles
cd dotfiles

# Sync my Sublime Text 3 settings
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ./sublimetext/Packages ~/.config/sublime-text-3

# Sublime Linter for ST3
# TODO

# Auto File Name for ST3
# TODO

# Install NodeJS
wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get install python-software-properties python g++ make
sudo apt-get install --yes nodejs
npm install -g grunt-cli jshint jscs csslint yo bower http-server marked eslint
eslint --init

# Install Nginx
sudo apt-get install nginx

# Install Ubuntu Tweak
sudo apt-get install unity-tweak-tool

# Install ibus-unikey
sudo apt-get install ibus-unikey
# Mannual: Add ibus-daemon to start up program

# TODO: install Source Code Pro fonts via git & command line
