#!/bin/bash

set -ex

pip3 install --upgrade --user \
    autopep8 \
    flake8 \
    pep8-naming \
    pylint \
    requests \
    tabulate
