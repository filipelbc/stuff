#!/bin/bash

set -ex

pip3 install --upgrade --user \
    autopep8 \
    black \
    flake8 \
    pep8-naming \
    pylint \
    requests \
    tabulate
