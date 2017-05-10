# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,functions,extra,secrets}; do
  [ -r "$file" ] && source "$file"
done
unset file

# append history
shopt -s histappend

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Only show directories when autocompleting using cd or rmdir
complete -d cd rmdir

# init pyenv
if type pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
    pyenv virtualenvwrapper_lazy
fi

#add rvm if it's there
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.git-completion.sh

hist import
