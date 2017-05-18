# dotfiles

## Installation

```bash
git clone https://github.com/reaperhulk/dotfiles.git && cd dotfiles && ./install-dotfiles.sh
```

There is a secondary script `macos-defaults.sh` that will set up many of the defaults I prefer...

Next there is a Brewfile that can be executed via `brew bundle` (this must be done before Python setup).

Finally, there's also `python-setup.sh` which will install a set of Pythons, set the proper global versions,
and install a few packages from PyPI that are part of my core setup.

This will create symlinks, not copy. You can then update with a fresh git pull at any time.

You will need to separately install vundle and then run `:PluginInstall` before vim will
work properly.

##Requirements
* Brew
