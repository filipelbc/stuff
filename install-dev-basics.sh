#!/bin/bash

set -ex

# Python development helpers
pip3 install --upgrade --user \
    autopep8 \
    flake8 \
    pep8-naming \
    pylint \
    requests \
    tabulate

# External stuff
other="$PWD/../../other"

mkdir -p $other

# Vim
cd $other
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
    git clone https://git.savannah.gnu.org/git/emacs/org-mode.git
fi
cd org-mode
git pull
git clean -xdf
make autoloads
make
sudo make install

# pgFormatter
cd $other
if [ ! -d pgFormatter ]
then
    git clone https://github.com/darold/pgFormatter
fi
cd pgFormatter
git pull
git clean -xdf
perl Makefile.PL
make
sudo make install

cd $other
sudo wget -q -O /usr/share/emacs/site-lisp/htmlize.el 'https://raw.githubusercontent.com/hniksic/emacs-htmlize/master/htmlize.el'
sudo wget -q -O /usr/share/emacs/site-lisp/ox-gfm.el 'https://raw.githubusercontent.com/larstvei/ox-gfm/master/ox-gfm.el'

# Bat
wget -q -O bat.deb 'https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-musl_0.18.3_amd64.deb'
sudo dpkg -i bat.deb
rm bat.deb

# Delta
wget -q -O delta.deb 'https://github.com/dandavison/delta/releases/download/0.10.1/git-delta-musl_0.10.1_amd64.deb'
sudo dpkg -i delta.deb
rm delta.deb

# Tokei
wget -q -O tokei.tar.gz 'https://github.com/XAMPPRocky/tokei/releases/download/v12.1.2/tokei-x86_64-unknown-linux-musl.tar.gz'
tar -xzf tokei.tar.gz
mv tokei ~/bin
rm tokei.tar.gz

# Plantuml
cd ~/bin
mkdir -p java
rm -rf java/*
wget -q -O java/plantuml.jar 'https://ufpr.dl.sourceforge.net/project/plantuml/plantuml.jar'
