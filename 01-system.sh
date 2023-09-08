#!/bin/bash

set -ex

sudo apt -y install \
    apt-transport-https \
    bash-completion \
    ca-certificates \
    git \
    gnupg \
    lsb-release \
    wget

release=$(lsb_release -cs)
arch=$(dpkg --print-architecture)

echo '# Added' | sudo tee -a /etc/apt/sources.list

add-repository() {
    echo "$1" | sudo tee -a /etc/apt/sources.list
}

install-key() {
    wget -q -O - "$1" | gpg --dearmor | sudo tee "$2" > /dev/null
}

# PostgreSQL
key=/usr/share/keyrings/postgres-archive-keyring.gpg
install-key "https://www.postgresql.org/media/keys/ACCC4CF8.asc" ${key}
add-repository "deb [signed-by=${key}] http://apt.postgresql.org/pub/repos/apt/ ${release}-pgdg main"

# Docker
key=/usr/share/keyrings/docker-archive-keyring.gpg
install-key "https://download.docker.com/linux/debian/gpg" ${key}
add-repository "deb [arch=${arch} signed-by=${key}] https://download.docker.com/linux/debian ${release} stable"

# Google Chrome
key=/usr/share/keyrings/google-archive-keyring.gpg
install-key "https://dl-ssl.google.com/linux/linux_signing_key.pub" ${key}
add-repository "deb [arch=${arch} signed-by=${key}] http://dl.google.com/linux/chrome/deb/ stable main"

# Java
key=/usr/share/keyrings/java-adoptium-temurin-keyring.gpg
install-key "https://packages.adoptium.net/artifactory/api/gpg/key/public" ${key}
add-repository "deb [signed-by=${key}] https://packages.adoptium.net/artifactory/deb ${release} main"

# NodeJS
wget -q -O - "https://deb.nodesource.com/setup_20.x" | sudo bash -

# Update & Upgrade
sudo apt -y upgrade

# Install useful stuff
sudo apt-get -y install \
    autotools-dev \
    build-essential \
    cmake \
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
    libtool \
    peek \
    pwgen \
    rename \
    shellcheck \
    temurin-21-jdk \
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

# Add user to docker group
sudo usermod -aG docker "$USER"
