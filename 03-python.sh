#!/bin/bash

set -ex

sudo apt install \
    python3-dev \
    python3-pip \
    python3-virtualenv

pip3 install --upgrade --user --break-system-packages \
    autopep8 \
    black \
    flake8 \
    pep8-naming \
    pylint \
    requests \
    tabulate
