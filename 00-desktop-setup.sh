#!/bin/bash

set -ex

sudo apt -y purge \
    light-locker \
    firefox-esr-l10n*

sudo apt -y install \
    elementary-xfce-icon-theme \
    greybird-gtk-theme

xfconf-query -c xsettings -p /Net/ThemeName -s 'Greybird'
xfconf-query -c xsettings -p /Net/IconThemeName -s 'elementary-xfce-dark'
xfconf-query -c xfwm4 -p /general/theme -s 'Greybird'
