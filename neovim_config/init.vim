

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
    " set number              " Line numbers on
    set backspace=indent,eol,start      " Backspace for dummies
    set ignorecase
    set smartcase
    set hidden          " change buffer without saving
    set noerrorbells    " no beeps
    set noswapfile      " no swap file
    set nobackup        " no backup files
    set nocursorcolumn  " speed up syntax highlighting
    set nocursorline
    " set cursorline      " Highlight current line
    set showcmd

	" set laststatus=0	" disable status line

    set lazyredraw

    " PERFORMANCE
    set synmaxcol=200
	
	" for update
	set updatetime=100


    " With system clipboard
    " set clipboard+=unnamedplus
    " set clipboard+=unnamed

    if has('mouse')
        set mouse=a
    endif

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

    " theme / colorscheme
	" Plug 'chriskempson/base16-vim'
	" Plug 'dracula/vim'
    " Plug 'altercation/vim-colors-solarized'
    Plug 'sheerun/vim-polyglot'

    Plug 'itchyny/lightline.vim'

    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'qpkorr/vim-bufkill'
	Plug 'bronson/vim-visual-star-search'

    " Enhance operation
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-unimpaired'
	" Plug 'jiangmiao/auto-pairs'
	" Plug 'Raimondi/delimitMate'


    " Programming
    Plug 'w0rp/ale'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		Plug 'zchee/deoplete-go', { 'do': 'make'}
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif

    """ if has('nvim')
    """     Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemotePlugin') }
    """     Plug 'zchee/deoplete-go', { 'do': 'make'}
    """ else
    """     Plug 'maralla/completor.vim'
    """ endif

    " Python
    " Plug 'davidhalter/jedi-vim'

    call plug#end()
    " End plug
" }


""""""""""
" Plugin config {
	" { lightline
		set laststatus=2
	" }
    " NERDTree {
        noremap <Leader>n :NERDTreeToggle<CR>
        noremap <Leader>N :NERDTreeFind<CR>

        let NERDTreeShowHidden=1

        " Close nerdtree and vim on close file
        " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.sw[op]$', '^\.git$', '.DS_Store', '.vim$']
        let NERDTreeQuitOnOpen=0  " Close the tree window after opening a file
        let NERDTreeMouseMode=2
    " }

    " nerdtree-tabs {
        " default is 0.
        " set 2, if directory was given as startup arg
        let g:nerdtree_tabs_open_on_console_startup=2

        " autofind and select currently opened file
        let g:nerdtree_tabs_autofind=1

        let g:NERDTreeWinSize=30
    " }

    " deoplete.nvim {
        if has('nvim')
            let g:deoplete#enable_at_startup=1
            set completeopt+=noselect
			"
            " automatically closing the scratch window. :pc, :pclose
            autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
        endif
    " }

    """ " deoplete-go settings {
    """     let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    """     let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    """ " }

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
    " }

    " ALE {
		" let g:ale_linters = {'go': ['gometalinter'] }
		call ale#linter#Define('go', {
		\   'name': 'revive',
		\   'output_stream': 'both',
		\   'executable': 'revive',
		\   'read_buffer': 0,
		\   'command': 'revive %t',
		\   'callback': 'ale#handlers#unix#HandleAsWarning',
		\})

		let g:ale_lint_on_text_changed = 'never'
    " }

    " vim-go {
        let g:go_fmt_fail_silently = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_interfaces = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_fields = 1
        let g:go_highlight_types = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
        let g:go_highlight_extra_types = 1

        " Enable goimports to automatically insert import paths instead of gofmt
        let g:go_fmt_command = "goimports"
        " let g:go_def_mode = 'godef'
        let g:go_list_type = "quickfix"
        " let g:go_def_mode = "guru"

        " GoDecls search include 'function and type'
        let g:go_decls_includes = "func,type"

        let g:go_textobj_include_function_doc = 1

        let g:go_auto_type_info = 0  " AutoTypeInfo
        let g:go_auto_sameids = 0   " auto Identifier highlighting
        let g:go_gocode_unimported_packages = 1
        let g:go_autodetect_gopath = 1

        let g:go_metalinter_autosave = 0
        let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

        " edit config
        let g:go_fmt_autosave = 1
        let g:go_template_autocreate = 0

        " nmap <C-g> :GoDecls<cr>
        " imap <C-g> <esc>:<C-u>GoDecls<cr>
        nmap <Leader>g :GoDecls<CR>

        augroup go
          autocmd!
        
          autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
          autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
          autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
        
          autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
        
          autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
          autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
        
          autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
        
          " I like these more!
		  " called :A, :AV, :AS and :AT. Here :A works 
          autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
          autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
          autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
          autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
        augroup END

    " }
	

	""" disable pop-up menu
	""" " { OPTIONS 
	""" 	set completeopt=preview,menuone
	""" 
	""" 	" Hide the autocompletion scratch/preview window.
	""" 	set completeopt-=preview
	""" " }
	

	" { key remap
		nnoremap <CR> :nohlsearch<cr>
	" }
	
	
	"{ colorscheme
		" set termguicolors  " grey color
		" let base16colorspace=256

		" colorscheme base16-default-dark
	"}
" }

""""""""""
