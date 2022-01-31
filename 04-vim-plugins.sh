#!/bin/bash

set -ex

if [ ! -d ~/.vim/bundle/Vundle.vim ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +PluginUpdate +qall

cd ~/.vim/bundle/YouCompleteMe
python3 ./install.py --ts-completer --rust-completer
