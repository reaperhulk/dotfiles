#!/bin/bash
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd $(dirname "$0")
    CWD=`pwd`
    ln -sf $CWD/.aliases ~/.aliases
    ln -sf $CWD/.bash_profile ~/.bash_profile
    ln -sf $CWD/.bash_prompt ~/.bash_prompt
    ln -sf $CWD/.bashrc ~/.bashrc
    ln -sf $CWD/.exports ~/.exports
    ln -sf $CWD/.functions ~/.functions
    ln -sf $CWD/.gitattributes ~/.gitattributes
    ln -sf $CWD/.gitconfig ~/.gitconfig
    ln -sf $CWD/.gitignore ~/.gitignore
    ln -sf $CWD/.gvimrc ~/.gvimrc
    ln -sf $CWD/.inputrc ~/.inputrc
    rm -rf ~/.vim
    ln -sf $CWD/.vim ~/.vim
    ln -sf $CWD/.vimrc ~/.vimrc
    mkdir -p ~/.vim-tmp
    source "$HOME/.bash_profile"
fi
