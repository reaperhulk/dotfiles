#!/bin/bash

pyenv install 2.7.15
pyenv install 3.7.0
pyenv global 3.7.0 2.7.15
pip install flake8 tox virtualenvwrapper
