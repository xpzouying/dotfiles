#!/bin/bash


## Install vim-plug for `neovim`:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir $HOME/.config/nvim/
ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim
