

" zouying variables {
    :let zynvimpath = "$HOME/.config/nvim"
    :let zynvimpathplugged = zynvimpath . "/plugged"
"}


" General {
    set nocompatible
    syntax on
    set autoread " auto-reread changed files without asking
    set autoindent
    set encoding=utf-8  " UTF8
    set incsearch       " increase search
    set hlsearch        "highlight search
    set tabstop=4       " Number of spaces that a <tab> represents in a file
    set shiftwidth=4    " Use indents of 4 spaces
    " set expandtab       " Tabs are spaces, not tabs
    set noexpandtab
    set softtabstop=4   " Number of spaces that a <tab> represents
    set shiftwidth=4
    set smarttab
    " set relativenumber
    set number              " Line numbers on
    set backspace=indent,eol,start      " Backspace for dummies
    set ignorecase
    set smartcase
    set hidden          " change buffer without saving
    set noerrorbells    " no beeps
    set noswapfile      " no swap file
    set nobackup        " no backup files
	set nowritebackup   " some servers have issues with backup files, see #649. with nobackup
    set nocursorcolumn  " speed up syntax highlighting
    set nocursorline
    " set cursorline      " Highlight current line
    set showcmd

	" set laststatus=0	" disable status line
	" set cmdheight=2

	" always show signcolumns
	" set signcolumn=yes

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

    set lazyredraw

    " PERFORMANCE
    set synmaxcol=200
	
	" for update
	set updatetime=50

	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/bundle/*,*/node_modules/*

    " With system clipboard
    " set clipboard+=unnamedplus
    " set clipboard+=unnamed
	" set clipboard=unnamed
	set history=100

    " if has('mouse')
    "     set mouse=a
    " endif

    " set guicursor=
    set t_Co=256
" }


" Key-mapping {
    let mapleader=","

    " Move to the next & previous buffer
    map <C-j> :bprevious<CR>
    map <C-k> :bnext<CR>

    " fast saving
    nnoremap <leader>w :w!<cr>
    nnoremap <leader>q :q!<cr>

    " Some useful quickfix shortcuts for quickfix
    " map <C-n> :cn<CR>
    " map <C-m> :cp<CR>
    nnoremap <leader>a :cclose<CR>

	" Highlight the current word under the cursor
	nmap <leader>sw :set hlsearch<CR>mm*N`m

	" System clipboard niceties. (Stolen from Mastering Vim Quickly)

	map ,y "+y
	map ,d "+d
	map ,p "+p
	map ,P "+P

" }


" Plugin - vim-plug{
    " DoRmotePlugin {
        function! DoRemotePlugin(arg)
            UpdateRemotePlugins
        endfunction

    " }

    " Begin section
    call plug#begin(zynvimpathplugged)
    " call plug#begin('~/.config/nvim/plugged')
    " call plug#begin('~/.vim/autoload')  " for vimrc

    Plug 'itchyny/lightline.vim'
	Plug 'flazz/vim-colorschemes'

    Plug 'qpkorr/vim-bufkill'
	Plug 'bronson/vim-visual-star-search'

    " Enhance operation
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'terryma/vim-multiple-cursors'

    " Programming
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    call plug#end()
    " End plug
" }


""""""""""
" Plugin config {

	" { lightline
		set laststatus=2
	" }

    " fzf {
        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1

        " [[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

        " [Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'

		" search in current word
		nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
		nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

        map <leader>b :Buffers<cr>
        map <C-p> :Files<CR>

		" https://github.com/junegunn/fzf.vim#advanced-customization
		" Override Colors command. You can safely do this in your .vimrc as fzf.vim
		" will not override existing commands.
		command! -bang Colors
					\ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
		"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
		"   :Ag! - Start fzf in fullscreen and display the preview window above
		command! -bang -nargs=* Ag
					\ call fzf#vim#ag(<q-args>,
					\                 <bang>0 ? fzf#vim#with_preview('up:60%')
					\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
					\                 <bang>0)
		" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
		command! -bang -nargs=* Rg
					\ call fzf#vim#grep(
					\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
					\   <bang>0 ? fzf#vim#with_preview('up:60%')
					\           : fzf#vim#with_preview('right:50%:hidden', '?'),
					\   <bang>0)
		" Likewise, Files command with preview window
		command! -bang -nargs=? -complete=dir Files
					\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    " }

	" { key remap
		nnoremap <CR> :nohlsearch<cr>
	" }
" }

""""""""""
