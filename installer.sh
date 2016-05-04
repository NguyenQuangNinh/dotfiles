#!/bin/bash

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

# Install Package Manager for Sublime Text 3
mkdir -p ~/.config/sublime-text-3/'Installed Packages'
cd ~/.config/sublime-text-3/'Installed Packages' && { curl -O 'https://packagecontrol.io/Package Control.sublime-package' ; cd -; }
sudo chown -R $1: ~/.config/sublime-text-3/

# Sublime Linter for ST3
# TODO

# Auto File Name for ST3
# TODO

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
#wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get -y install python-software-properties python g++ make
sudo apt-get -y install --yes nodejs
# Update npm to latest version
sudo npm install -g npm
sudo npm install -g grunt-cli jshint jscs csslint yo bower http-server marked eslint
eslint --init

# Install Ruby & RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

if [ -f /etc/profile.d/rvm.sh ];
then
  source /etc/profile.d/rvm.sh
else
  bash --login
fi

rvm install 2.2
rvm use 2.2
rvm --default use 2.2
gem install rails

# Install Nginx
sudo apt-get -y install nginx

# Install Docker
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get -y update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install apparmor
sudo apt-get -y install docker-engine
sudo service docker start

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get -y update
sudo apt-get -y install -y mongodb-org
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
sudo service mongod start
cat /var/log/mongodb/mongod.log

# Install Ubuntu Tweak
sudo apt-get -y install unity-tweak-tool

# Install ibus-unikey
sudo apt-get -y install ibus-unikey
# Mannual: Add ibus-daemon to start up program

# Install Monaco font
wget https://github.com/NguyenQuangNinh/dotfiles/raw/master/.fonts/MONACO.TTF
FONT_DIR=/usr/share/fonts/truetype/custom/
sudo mkdir -p $FONT_DIR
mv MONACO.TTF $FONT_DIR
sudo fc-cache -f -v
