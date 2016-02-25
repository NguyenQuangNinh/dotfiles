#!/bin/bash

# Add Sublime Text PPA (-y for unattended process)
#sudo apt-add-repository -y ppa:webupd8team/sublime-text-3
# Add NodeJS PPA
#sudo apt-add-repository -y ppa:chris-lea/node.js
wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash -
# Add Ubuntu Tweak PPA
#sudo apt-add-repository -y ppa:tualatrix/ppa
#sudo apt-get install ubuntu-tweak
#
sudo apt-add-repository -y 'deb http://dl.google.com/linux/chrome/deb/ stable main'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Update all repo
sudo apt-get update

# Install neccessary packages:
sudo apt-get install git subversion meld ubuntu-restricted-extras

# Install Google Chrome Canary
sudo apt-get install google-chrome-unstable

# Install Sublime Text
#sudo apt-get install sublime-text-installer

# Sync my Sublime Text 3 settings
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ../sublimetext/Packages ~/.config/sublime-text-3

# Package Control for ST3: (ST3 will automatically install packages via previous settings)
# cd ~/.config/sublime-text-3/Packages/
# git clone https://github.com/wbond/sublime_package_control.git "Package Control"
# cd "Package Control"
# git checkout python3

# Sublime Linter for ST3
# TODO

# Auto File Name for ST3
# TODO

# Install NodeJS
sudo apt-get install python-software-properties python g++ make
sudo apt-get install --yes nodejs
npm install -g grunt-cli jshint jscs csslint yo bower http-server marked

# Install Nginx
sudo apt-get install nginx

# Install Ubuntu Tweak
sudo apt-get install unity-tweak-tool

# Install ibus-unikey
sudo apt-get install ibus-unikey
# Mannual: Add ibus-daemon to start up program

# TODO: install Source Code Pro fonts via git & command line
