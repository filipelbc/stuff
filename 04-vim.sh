#!/bin/bash

set -ex

sudo apt-get -y build-dep vim

other="$PWD/../../other"
mkdir -p "$other"
cd "$other"

if [ ! -d vim ]
then
    git clone https://github.com/vim/vim.git
fi
cd vim
git pull
git clean -xdf
make clean
cd src
./configure \
    --with-features=huge \
    --with-x \
    --enable-python3interp=yes \
    --enable-gui=no
make
sudo make install

mkdir -p "/var/tmp/$USER/vim/"{swap,backups}

if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +PluginUpdate +qall

cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py --ts-completer --rust-completer
