#!/bin/bash

set -ex

sudo apt update -y

./00-desktop-setup.sh
./01-system.sh
./02-home.sh
./03-python.sh
./04-vim-install.sh
./04-vim-plugins.sh
./05-utils.sh
