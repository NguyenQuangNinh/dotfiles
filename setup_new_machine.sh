#!/bin/bash

# Don't turn off my screen
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 0
gsettings set org.gnome.desktop.session idle-delay 0

# Add Sublime Text PPA (-y for unattended process)
sudo apt-add-repository -y ppa:webupd8team/sublime-text-3

#Google Chrome
sudo apt-add-repository -y 'deb http://dl.google.com/linux/chrome/deb/ stable main'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Update all repo
sudo apt-get -y update

# Install neccessary packages:
sudo apt-get -y install git subversion meld ubuntu-restricted-extras

# Install Google Chrome
sudo apt-get -y install google-chrome-stable

# Install Sublime Text
sudo apt-get -y install sublime-text-installer

cd ~/Desktop
git clone https://github.com/NguyenQuangNinh/dotfiles
cd dotfiles

# Sync my Sublime Text 3 settings
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "README.md" -av ./sublimetext/Packages ~/.config/sublime-text-3
sudo chown -R $USER: ~/.config/sublime-text-3/

# Sublime Linter for ST3
# TODO

# Auto File Name for ST3
# TODO

# Install NodeJS
wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get -y install python-software-properties python g++ make
sudo apt-get -y install --yes nodejs
# Update npm to latest version
sudo npm install -g npm
sudo npm install -g grunt-cli jshint jscs csslint yo bower http-server marked eslint
eslint --init

# Install Ruby & RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.2
rvm use 2.2
rvm --default use 2.2
gem install rails

# Install Nginx
sudo apt-get -y install nginx

# Install Ubuntu Tweak
sudo apt-get -y install unity-tweak-tool

# Install ibus-unikey
sudo apt-get -y install ibus-unikey
# Mannual: Add ibus-daemon to start up program

# TODO: install Source Code Pro fonts via git & command line
