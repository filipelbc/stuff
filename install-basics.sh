#!/bin/bash

set -ex

cd ~

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

sudo apt-add-repository -y ppa:webupd8team/java

wget -q -O - "https://download.docker.com/linux/ubuntu/gpg" | sudo apt-key add -
sudo apt-add-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -
sudo apt-add-repository -y "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"

wget -q -O - "https://packages.microsoft.com/keys/microsoft.asc" | sudo apt-key add -
sudo apt-add-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-add-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main"

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install \
    apt-transport-https \
    autotools-dev \
    build-essential \
    ca-certificates \
    cmake \
    code \
    curl \
    docker-ce \
    dotnet-sdk-2.1 \
    emacs-nox \
    feh \
    git \
    google-chrome-stable \
    gparted \
    gthumb \
    graphviz \
    htop \
    intltool \
    libtool \
    mercurial \
    oracle-java8-installer \
    pinta \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    pwgen \
    rename \
    software-properties-common \
    ssh \
    terminator \
    tree \
    texinfo \
    unrar \
    usb-creator-gtk \
    valgrind \
    vlc \
    xclip \
    xscreensaver \
    xvfb

# Remove redundant entry
sudo sed -i -e '/google/d' /etc/apt/sources.list

# Add user to docker group
sudo gpasswd -a $USER docker

# Docker-compose
sudo wget -q -O /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose

# Python development helpers
pip3 install autopep8 flake8 pep8-naming

# Other things to install
#mysql workbench
#mysql client
#postgres client
#chromedriver
#node.js
#js-beautify

mkdir -p ~/.config/terminator

for i in bashrc \
         config/flake8 \
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
    ln -sf $PWD/rc/$i ~/.$i
done

rm -rf ~/bin
ln -sf $PWD/bin ~

rm -rf ~/Downloads
ln -sf /files/Downloads ~/Downloads

# Install Dropbox
wget -q -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar -xzf -

# Add the following command to startup:
#
#   env DBUS_SESSION_BUS_ADDRESS='' sh -c  ~/.dropbox-dist/dropboxd

echo "Have you enabled the deb-src repositories?"
echo "If not, please enable and run 'apt-get -y update' before continuing."
echo "Press any key to continue."
read

sudo apt-get build-dep vim

mkdir -p ~/src

cd ~/src
git clone https://github.com/vim/vim.git
cd vim
make clean
cd src
./configure --with-features=huge \
            --with-x \
            --enable-python3interp=dynamic \
            --enable-gui=no
make
sudo make install

vim +PluginInstall +PluginUpdate +qall

# YouCompleteMe (Vim plugin)
cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py

# Orgmode
cd ~/src
git clone https://code.orgmode.org/bzg/org-mode.git
cd org-mode
make
sudo make install

cd ~/src
git clone https://github.com/hniksic/emacs-htmlize/
cd emacs-htmlize
sudo cp htmlize.el /usr/share/emacs/site-lisp/

cd ~/bin
rm -f diff-so-fancy
wget "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"
chmod +x diff-so-fancy

cd ~/bin
rm -rf java/
mkdir -p java
wget -q -O java/plantuml.jar "https://ufpr.dl.sourceforge.net/project/plantuml/plantuml.jar"

cd ~
