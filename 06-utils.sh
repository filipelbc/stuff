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
wget -q -O bat.deb 'https://github.com/sharkdp/bat/releases/download/v0.26.1/bat_0.26.1_amd64.deb'
sudo dpkg -i bat.deb
rm bat.deb

# Delta
wget -q -O delta.deb 'https://github.com/dandavison/delta/releases/download/0.19.2/git-delta-musl_0.19.2_amd64.deb'
sudo dpkg -i delta.deb
rm delta.deb

# Dust
wget -q -O dust.deb 'https://github.com/bootandy/dust/releases/download/v1.2.5/du-dust_1.2.5-1_amd64.deb'
sudo dpkg -i dust.deb
rm dust.deb

# Tokei
cargo install tokei

# Plantuml
cd ~/bin
mkdir -p java
rm -rf java/*
wget -q -O java/plantuml.jar 'https://github.com/plantuml/plantuml/releases/download/v1.2026.8/plantuml-1.2026.8.jar'
