#!/bin/bash

set -ex

# Bat
wget -q -O bat.deb 'https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-musl_0.18.3_amd64.deb'
sudo dpkg -i bat.deb
rm bat.deb

# Delta
wget -q -O delta.deb 'https://github.com/dandavison/delta/releases/download/0.11.3/git-delta-musl_0.11.3_amd64.deb'
sudo dpkg -i delta.deb
rm delta.deb
