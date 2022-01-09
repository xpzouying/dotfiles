
" --- basic config ---

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set encoding=utf-8
set title
set autoindent
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab

" mouse mode: a=all, n=normal, v=virtual, i=insert, ...
set mouse=a


" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=
set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw

set smarttab
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

set path+=**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/bundle/*,*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Use OSX clipboard to copy and to paste
set clipboard+=unnamedplus

let mapleader=","

" highlight {
    " set cursorline
    " set cursorcolumn
    " highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
    highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000
" }

" --- end ---




" --- begin - vim-plug ---
call plug#begin()


" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'  " better UI

Plug 'nvim-lua/plenary.nvim'  " with telescope
Plug 'nvim-telescope/telescope.nvim'


" --- end - vim-plug ---
" Initialize plugin system
call plug#end()


" ---------- shortcut ----------

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

nmap <Space> <C-w>w


" vim-go {
	" Navigation commands
	au FileType go nmap <Leader>ds <Plug>(go-def-split)
	au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
	
	" Alternate commands - openn corresponding test file
	au FileType go nmap <Leader>ae <Plug>(go-alternate-edit)
	au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

	" Use new vim 8.2 popup windows for Go Doc
	let g:go_doc_popup_window = 1
" }

" telescope {
    nnoremap <C-p> <cmd>Telescope find_files<cr>
    nnoremap <C-f> <cmd>Telescope live_grep<cr>
    nnoremap <leader>b <cmd>Telescope buffers<cr>
" }

" ---------- shortcut ----------


