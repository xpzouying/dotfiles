#!/bin/bash -e

set -e

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


cat > ~/.vimrc <<EOL

set nocompatible
set autoread
set encoding=utf-8 nobomb
set incsearch
set hlsearch
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

set clipboard=unnamed

let mapleader=","

set dir=/tmp
set backupdir=/tmp

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'govim/govim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

map <C-p> :Files<CR>

" let g:go_fmt_command = "goimports"
" let g:go_fmt_command = "gopls"
" let g:go_info_mode = 'gopls'
" let g:go_def_mode = 'gopls'

EOL
