#!/bin/bash

set -ex

# Remove useless stuff
sudo apt-get -y purge \
    brltty-x11 \
    brltty \
    espeak \
    gnome-accessibility-themes \
    light-locker \
    parole \
    pidgin-otr \
    pidgin \
    ristretto \
    thunderbird

# PostgreSQL

wget -q -O - "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | sudo apt-key add -
sudo apt-add-repository -yn "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main"

# Java
sudo apt-add-repository -yn ppa:linuxuprising/java

# Docker
wget -q -O - "https://download.docker.com/linux/ubuntu/gpg" | sudo apt-key add -
sudo apt-add-repository -yn "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Google Chrome
wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -
sudo apt-add-repository -yn "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"

# VS Code & Dotnet
wget -q -O - "https://packages.microsoft.com/keys/microsoft.asc" | sudo apt-key add -
sudo apt-add-repository -yn "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-add-repository -yn "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main"

# Yarn
wget -q -O - "https://dl.yarnpkg.com/debian/pubkey.gpg" | sudo apt-key add -
sudo apt-add-repository -yn "deb https://dl.yarnpkg.com/debian/ stable main"

# NodeJS
wget -q -O - "https://deb.nodesource.com/setup_14.x" | sudo bash -

# Peek (screen recording tool)
sudo apt-add-repository -yn "ppa:peek-developers/stable"

# Inkscape
sudo apt-add-repository -yn "ppa:inkscape.dev/stable"

# Update & Upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# Install useful stuff
sudo apt-get -y install \
    apt-transport-https \
    autotools-dev \
    build-essential \
    ca-certificates \
    cmake \
    code \
    curl \
    docker-ce \
    dotnet-sdk-5.0 \
    emacs-nox \
    feh \
    git \
    google-chrome-stable \
    gparted \
    graphviz \
    gthumb \
    htop \
    intltool \
    jq \
    libtool \
    mercurial \
    oracle-java16-installer \
    peek \
    pwgen \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    rename \
    shellcheck \
    software-properties-common \
    ssh \
    terminator \
    texinfo \
    tree \
    unrar \
    usb-creator-gtk \
    valgrind \
    vlc \
    xclip \
    xscreensaver \
    xvfb

# Remove redundant entries
sudo sed -i -e '/google/d' -e '/vscode/d' /etc/apt/sources.list

# Remove splash screen
sudo sed -i -e 's/quiet splash//' /etc/default/grub
sudo update-grub

# Add user to docker group
sudo gpasswd -a "$USER" docker

# Docker-compose
sudo wget -q -O /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose

# Python development helpers
pip3 install --upgrade --user \
    autopep8 \
    flake8 \
    pep8-naming \
    pylint \
    requests \
    tabulate

# Create symlinks
stuff="$PWD"

mkdir -p ~/.config/terminator

for i in bashrc \
         config/flake8 \
         config/pylintrc \
         config/pep8 \
         config/terminator/config \
         dircolors \
         fonts \
         emacs \
         gitconfig \
         inputrc \
         ssh \
         vim \
         vimrc
do
    rm -rf ~/.$i
    ln -sf $stuff/rc/$i ~/.$i
done

rm -rf ~/bin
ln -sf $stuff/bin ~

rm -rf ~/Downloads
ln -sf /files/downloads ~/Downloads

# External stuff
other=$stuff/../../other

mkdir -p $other

# FIXME: figure out explicit list of dependencies
echo "Have you enabled the deb-src repositories?"
echo "If not, please enable and run 'apt-get -y update' before continuing."
echo "Press any key to continue."
read

# Vim
sudo apt-get build-dep vim

cd $other
if [ ! -d vim ]
then
    git clone https://github.com/vim/vim.git
fi
cd vim
git checkout master
git pull
git clean -xdf
make clean
cd src
./configure --with-features=huge \
            --with-x \
            --enable-python3interp=yes \
            --enable-gui=no
make
sudo make install

mkdir -p /var/tmp/filipe/vim/{swap,backups}

if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +PluginUpdate +qall

# YouCompleteMe (Vim plugin)
cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py --ts-completer --rust-completer

# Orgmode
cd $other
if [ ! -d org-mode ]
then
    git clone https://code.orgmode.org/bzg/org-mode.git
fi
cd org-mode
git checkout master
git pull
git clean -xdf
make
sudo make install

cd $other
sudo wget -q -O /usr/share/emacs/site-lisp/htmlize.el 'https://raw.githubusercontent.com/hniksic/emacs-htmlize/master/htmlize.el'
sudo wget -q -O /usr/share/emacs/site-lisp/ox-gfm.el 'https://raw.githubusercontent.com/larstvei/ox-gfm/master/ox-gfm.el'

# Bat & Delta

wget -q https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb
sudo dpkg -i bat-musl_*.deb

wget -q https://github.com/dandavison/delta/releases/download/0.6.0/git-delta-musl_0.6.0_amd64.deb
sudo dpkg -i git-delta-musl_*.deb

rm *.deb

# Tokei

wget -q https://github.com/XAMPPRocky/tokei/releases/download/v12.1.2/tokei-x86_64-unknown-linux-musl.tar.gz
tar -xzf tokei-*.tar.gz
mv tokei ~/bin
rm tokei-*.tar.gz

# Plantuml
cd ~/bin
mkdir -p java
rm -rf java/*
wget -q -O java/plantuml.jar "https://ufpr.dl.sourceforge.net/project/plantuml/plantuml.jar"

# Back to stuff
cd $stuff
