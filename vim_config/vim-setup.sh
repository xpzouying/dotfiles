#!/bin/bash -e


mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go


echo '
execute pathogen#infect()

let g:go_fmt_command = "goimports"

set autoindent
filetype plugin indent on

set dir=/tmp
set backupdir=/tmp
' > ~/.vimrc
