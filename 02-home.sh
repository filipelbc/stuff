#!/bin/bash

set -ex

stuff="$PWD"

mkdir -p ~/.config/terminator

for i in \
    bashrc \
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
    rm -rf ~/".$i"
    ln -sf "$stuff/rc/$i" ~/".$i"
done

rm -rf ~/bin
ln -sf "$stuff/bin" ~

rm -rf ~/{Downloads,Documents,Music,Pictures,Public,Templates,Videos}
ln -sf /files/downloads ~/Downloads
