#!/bin/bash

source ../OS.sh

# install fish
if [[ "$PLATFORM" == 'MACOSX' ]]; then
    brew install fish
fi

if [[ "$PLATFORM" == 'LINUX' ]]; then
    sudo apt-add-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish
fi

# switch to fish: https://github.com/fish-shell/fish-shell
chsh -s /usr/local/bin/fish

# uninstall
# chsh -s /bin/bash


# install fisherman for plugin manager
echo "install fisherman"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# install plugins
fisher z fzf
fisher install tuvistavie/fish-ssh-agent
