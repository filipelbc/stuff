#!/bin/bash

set -ex

stuff="$PWD"

mkdir -p ~/.config/terminator

for i in \
    bashrc \
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
    rm -rf ~/".$i"
    ln -sf "$stuff/rc/$i" ~/".$i"
done

rm -rf ~/bin
ln -sf "$stuff/bin" ~

rm -rf ~/{Documents,Music,Pictures,Public,Templates,Videos}

mkdir -p "/var/tmp/$USER/vim/"{swap,backups}
