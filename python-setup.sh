#!/bin/bash

pyenv install 2.7.13
pyenv install 3.6.1
pyenv global 3.6.1 2.7.13
pip install flake8 Pygments tox virtualenvwrapper
