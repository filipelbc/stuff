#!/bin/bash

set -ex

curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    --output ~/.vim/autoload/plug.vim \
    --location \
    --create-dirs \
    --fail

sudo npm install --global typescript eslint

# required by deoplete
pip3 install --upgrade --user --break-system-packages \
    msgpack \
    pynvim

vim +PlugInstall +PlugUpdate +qa
