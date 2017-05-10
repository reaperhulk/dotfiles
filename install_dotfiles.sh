#!/bin/bash
#This file will symlink the dotfiles from this directory to your home dir.
#You can use this to leave your dotfiles in dropbox to sync between machines

#It will also optionally add a path for homebrew bash into /etc/shells if it's not
#present and set your shell to that
read -p "Make bash4 your default shell (if installed)? (y/n) " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if type /usr/local/bin/bash 2>/dev/null; then
        if ! grep -qe "^/usr/local/bin/bash$" "/etc/shells"; then
            sudo sh -c 'echo "/usr/local/bin/bash" >> /etc/shells' # add to list of allowable shells
            echo -e "\nAdded shell to /etc/shells"
            chsh -s /usr/local/bin/bash # set current user's shell
        else
            echo -e "\nShell already present in /etc/shells"
        fi
    else
        echo -e "\nbash4 not present where expected (/usr/local/bin/bash). Install it with homebrew"
    fi
fi
echo ""
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd $(dirname "$0")
    CWD=`pwd`
    #bash files
    ln -sf $CWD/.aliases ~/.aliases
    ln -sf $CWD/.bash_profile ~/.bash_profile
    ln -sf $CWD/.bash_prompt ~/.bash_prompt
    ln -sf $CWD/.bashrc ~/.bashrc
    ln -sf $CWD/.exports ~/.exports
    ln -sf $CWD/.secrets ~/.secrets
    ln -sf $CWD/.inputrc ~/.inputrc
    ln -sf $CWD/.functions ~/.functions
    #lesspipe (used with LESSOPEN in bash exports)
    rm -rf ~/.dotfiles-bin
    ln -sf $CWD/.dotfiles-bin ~/.dotfiles-bin
    #git specific
    ln -sf $CWD/.gitattributes ~/.gitattributes
    ln -sf $CWD/.gitconfig ~/.gitconfig
    ln -sf $CWD/.gitignore ~/.gitignore
    ln -sf $CWD/.git_template ~/.git_template
    ln -sf $CWD/.git-completion.sh ~/.git-completion.sh
    #vim specific
    ln -sf $CWD/.gvimrc ~/.gvimrc
    rm -rf ~/.vim
    ln -sf $CWD/.vim ~/.vim
    ln -sf $CWD/.vimrc ~/.vimrc
    mkdir -p ~/.vim-tmp
    #ruby specific
    ln -sf $CWD/.gemrc ~/.gemrc
    ln -sf $CWD/.irbrc ~/.irbrc
    ln -sf $CWD/.rvmrc ~/.rvmrc
    #python stuff
    ln -sf $CWD/.pypirc ~/.pypirc
    source "$HOME/.bash_profile"
fi
