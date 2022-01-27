#!/bin/bash

set -ex

sudo apt -y install \
    apt-transport-https \
    bash-completion \
    ca-certificates \
    git \
    gnupg \
    software-properties-common \
    wget

release=$(lsb_release -cs)
arch=$(dpkg --print-architecture)

# PostgreSQL
wget -q -O - "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | sudo apt-key add -
sudo apt-add-repository -y "deb http://apt.postgresql.org/pub/repos/apt/ ${release}-pgdg main"

# pgAdmin4
wget -q -O - "https://www.pgadmin.org/static/packages_pgadmin_org.pub" | sudo apt-key add -
sudo apt-add-repository -y "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/${release} pgadmin4 main"

# Docker
key=/usr/share/keyrings/docker-archive-keyring.gpg
wget -q -O - "https://download.docker.com/linux/debian/gpg" | sudo gpg --dearmor -o ${key}
sudo apt-add-repository -y "deb [arch=${arch} signed-by=${key}] https://download.docker.com/linux/debian ${release} stable"

# Google Chrome
wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -
sudo apt-add-repository -y "deb [arch=${arch}] http://dl.google.com/linux/chrome/deb/ stable main"

# VS Code
key=/usr/share/keyrings/docker-archive-keyring.gpg
wget -q -O - "https://packages.microsoft.com/keys/microsoft.asc" | sudo gpg --dearmor -o ${key}
sudo apt-add-repository -y "deb [arch=${arch} signed-by=${key}] https://packages.microsoft.com/repos/code stable main"

# NodeJS
wget -q -O - "https://deb.nodesource.com/setup_16.x" | sudo bash -

# Update & Upgrade
sudo apt -y upgrade

# Install useful stuff
sudo apt-get -y install \
    autotools-dev \
    build-essential \
    cmake \
    code \
    curl \
    docker-ce \
    emacs-nox \
    feh \
    google-chrome-stable \
    gparted \
    graphviz \
    htop \
    intltool \
    jq \
    libreoffice \
    libtool \
    nodejs \
    obs-studio \
    peek \
    pwgen \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    rename \
    shellcheck \
    terminator \
    texinfo \
    tree \
    vlc \
    xclip \
    xscreensaver

# Remove redundant entries
sudo sed -i -e '/google/d' -e '/microsoft/d' /etc/apt/sources.list

# Remove splash screen
sudo sed -i -e 's/quiet splash//' /etc/default/grub
sudo update-grub

# Docker-compose
sudo wget -q -O /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose

# Add user to docker group
sudo gpasswd -a "$USER" docker
