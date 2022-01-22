#!/bin/bash

set -ex

sudo apt -y purge \
    light-locker

# Add basic stuff
sudo apt -y update
sudo apt -y install \
    apt-transport-https \
    bash-completion \
    ca-certificates \
    elementary-xfce-icon-theme \
    git \
    gnupg \
    greybird-gtk-theme \
    software-properties-common \
    wget

# Set desktop theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird"
xfconf-query -c xsettings -p /Net/IconThemeName -s "elementary-xfce-dark"
xfconf-query -c xfwm4 -p /general/theme -s "Greybird"

# Google Chrome
wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -
sudo apt-add-repository -y "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"

# Update & Upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# Install useful stuff
sudo apt-get -y install \
    build-essential \
    google-chrome-stable \
    htop \
    obs-studio \
    peek \
    pwgen \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    rename \
    terminator \
    tree \
    vlc \
    xclip \
    xscreensaver

sudo apt-get -y autoremove

# Remove redundant entries
sudo sed -i -e '/google/d' -e '/vscode/d' /etc/apt/sources.list

# Create symlinks
stuff="$PWD"

mkdir -p ~/.config/terminator

for i in bashrc \
    config/flake8 \
    config/pylintrc \
    config/pep8 \
    config/terminator/config \
    dircolors \
    gitconfig \
    inputrc
do
    rm -rf ~/.$i
    ln -sf $stuff/rc/$i ~/.$i
done

rm -rf ~/bin
ln -sf $stuff/bin ~

rm -rf ~/Downloads
ln -sf /files/downloads ~/Downloads
