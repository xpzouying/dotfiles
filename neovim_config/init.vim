

" zouying variables {
    :let zynvimpath = "$HOME/.config/nvim"
    :let zynvimpathplugged = zynvimpath . "/plugged"


"}


" General {
    set nocompatible
    syntax on
    set encoding=utf-8  " UTF8
    set tabstop=4       " Number of spaces that a <tab> represents in a file
    set shiftwidth=4    " Use indents of 4 spaces
    set expandtab       " Tabs are spaces, not tabs
    set softtabstop=4   " Number of spaces that a <tab> represents
    set shiftwidth=4
    " set relativenumber
    " set smarttab
    set cursorline      " Highlight current line
    set nu              " Line numbers on
    set backspace=indent,eol,start      " Backspace for dummies
    set ignorecase
    set smartcase

    " With system clipboard
    " set clipboard+=unnamedplus
    " set clipboard+=unnamed

    " if has('mouse')
    "     set mouse=a
    " endif

    " For color {
    " Ref: https://github.com/joshdick/onedark.vim
    if (empty($TMUX))
        if (has("nvim"))
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif

        if (has("termguicolors"))
            set termguicolors
        endif
    endif
    "}

    set guicursor=

" }


" Key-mapping {
    let mapleader=","

    " Move to the next & previous buffer
    map <C-j> :bprevious<CR>
    map <C-k> :bnext<CR>

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

    " Feel & Look
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'  " better syntax highlight

    Plug 'vim-airline/vim-airline'

    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'

    Plug 'majutsushi/tagbar'


    " Enhance operation
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'

    " Programming
    Plug 'sheerun/vim-polyglot'  " for more language colorscheme support
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemotePlugin') }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Python
    Plug 'davidhalter/jedi-vim'

    call plug#end()
    " End plug
" }


""""""""""
" Plugin config {
    " lightline {
        set laststatus=2
        let g:airline_theme='onedark'

        let g:airline#extensions#branch#enabled=1
        let g:airline_powerline_fonts=1

        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled=1
        " Show just the file name
        " let g:airline#extensions#tabline#fnamemod=':t'
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
        let g:deoplete#enable_at_startup=1

        set completeopt+=noselect
        " automatically closing the scratch window. :pc, :pclose
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " }

    " deoplete-go settings {
        let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
        let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    " }

    " fzf {
        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1

        " [[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

        " [Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'

        " [Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'

        map <leader>b :Buffers<cr>
        map <leader>f :Files<cr>
        map <C-p> :Files<CR>

    " }

    " vim-go {
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
        let g:go_def_mode = 'godef'

        " GoDecls search include 'function and type'
        let g:go_decls_includes = "func,type"
        " let g:go_decls_includes = "func"  " just show func

        let g:go_textobj_include_function_doc = 1

        " :GoInfo
        autocmd FileType go nmap <Leader>i <Plug>(go-info)
        " let g:go_auto_type_info = 1
        " set updatetime=100

        " auto Identifier highlighting
        " let g:go_auto_sameids = 1

        " GoRun & GoBuild in go
        " autocmd FileType go nmap <leader>b <Plug>(go-build)
        " autocmd FileType go nmap <leader>r <Plug>(go-run)

        let g:go_test_timeout = '30s'

        " edit config
        let g:go_fmt_autosave = 1
        let g:go_fmt_command = "goimports"  "use goimport, not gofmt

        let g:go_template_autocreate = 0
    " }

    " fugitive {
        nnoremap <Leader>gs :Gstatus<CR>
        nnoremap <Leader> gd :Gdiff<CR>
    " }


    " EasyMotion {
        " <Leader>f{char} to move to {char}
        " map  <Leader>f <Plug>(easymotion-bd-f)
        " nmap <Leader>f <Plug>(easymotion-overwin-f)

        " s{char}{char} to move to {char}{char}
        nmap s <Plug>(easymotion-overwin-f2)

        " Move to line
        " map <Leader>L <Plug>(easymotion-bd-jk)
        " nmap <Leader>L <Plug>(easymotion-overwin-line)

        " Move to word
        map  <Leader>w <Plug>(easymotion-bd-w)
        nmap <Leader>w <Plug>(easymotion-overwin-w)
    " }

    " Tagbar {
        nmap <F8> :TagbarToggle<CR>

        let g:tagbar_width=30
     " }

    " jedi-vim {
        " jedi override previous config
        autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
    " }

    " colorscheme {
        colorscheme onedark
    " }
" }
""""""""""
