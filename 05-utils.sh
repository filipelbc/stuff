#!/bin/bash

set -ex

other="$PWD/../../other"
mkdir -p "$other"

# Orgmode
cd "$other"
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

sudo wget -q -O /usr/share/emacs/site-lisp/htmlize.el 'https://raw.githubusercontent.com/hniksic/emacs-htmlize/master/htmlize.el'
sudo wget -q -O /usr/share/emacs/site-lisp/ox-gfm.el 'https://raw.githubusercontent.com/larstvei/ox-gfm/master/ox-gfm.el'

# pgFormatter
cd "$other"
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

# Bat
wget -q -O bat.deb 'https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-musl_0.21.0_amd64.deb'
sudo dpkg -i bat.deb
rm bat.deb

# Delta
wget -q -O delta.deb 'https://github.com/dandavison/delta/releases/download/0.13.0/git-delta-musl_0.13.0_amd64.deb'
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
