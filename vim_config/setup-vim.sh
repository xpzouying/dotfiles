#!/bin/bash -e

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


cat > ~/.vimrc <<EOL

set nocompatible
set autoread
set encoding=utf-8
set incsearch
set hlsearch


call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

map <C-p> :Files<CR>

EOL
