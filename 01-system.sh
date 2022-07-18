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

# Signal
key=/usr/share/keyrings/signal-desktop-keyring.gpg
install-key "https://updates.signal.org/desktop/apt/keys.asc" ${key}
add-repository "deb [arch=${arch} signed-by=${key}] https://updates.signal.org/desktop/apt xenial main"

# PostgreSQL
key=/usr/share/keyrings/postgres-archive-keyring.gpg
install-key "https://www.postgresql.org/media/keys/ACCC4CF8.asc" ${key}
add-repository "deb [signed-by=${key}] http://apt.postgresql.org/pub/repos/apt/ ${release}-pgdg main"

# pgAdmin4
key=/usr/share/keyrings/pgadmin4-archive-keyring.gpg
install-key "https://www.pgadmin.org/static/packages_pgadmin_org.pub" ${key}
add-repository "deb [signed-by=${key}] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/${release} pgadmin4 main"

# Docker
key=/usr/share/keyrings/docker-archive-keyring.gpg
install-key "https://download.docker.com/linux/debian/gpg" ${key}
add-repository "deb [arch=${arch} signed-by=${key}] https://download.docker.com/linux/debian ${release} stable"

# Google Chrome
key=/usr/share/keyrings/google-archive-keyring.gpg
install-key "https://dl-ssl.google.com/linux/linux_signing_key.pub" ${key}
add-repository "deb [arch=${arch} signed-by=${key}] http://dl.google.com/linux/chrome/deb/ stable main"

# VS Code
key=/usr/share/keyrings/microsoft-archive-keyring.gpg
install-key "https://packages.microsoft.com/keys/microsoft.asc" ${key}
add-repository "deb [arch=${arch} signed-by=${key}] https://packages.microsoft.com/repos/code stable main"

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
sudo usermod -aG docker "$USER"
