

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
    set relativenumber
    " set smarttab
    set cursorline      " Highlight current line
    set nu              " Line numbers on
    set backspace=indent,eol,start      " Backspace for dummies
    set ignorecase
    set smartcase

    " With system clipboard
    " set clipboard+=unnamedplus
    set clipboard+=unnamed

    if has('mouse')
        set mouse=a
    endif

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

    " set neovim cursor shape
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" }


" Key-mapping {
    let mapleader=","

    " Move to the next & previous buffer
    nmap <F2> :bprevious<CR>
    nmap <F3> :bnext<CR>

    map <C-n> :cnext<CR>
    map <C-m> :cprevious<CR>
    nnoremap <leader>a :cclose<CR>


" }


" Programming {
    " Path to python interpreter for neovim
    " let g:python3_host_prog = '/usr/local/bin/python3'
    " Skip the check of neovim module
    " let g:python_host_skip_check = 1
    " let g:python3_host_skip_check = 1

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
    " Plug 'fatih/molokai'
    " Plug 'joshdick/onedark.vim'
    " Plug 'rakr/vim-one'
    " Plug 'mhinz/vim-startify'
    Plug 'altercation/vim-colors-solarized'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'

    Plug 'majutsushi/tagbar'
    Plug 'ntpeters/vim-better-whitespace'


    " Enhance operation
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'rking/ag.vim'

    " Programming
    Plug 'SirVer/ultisnips'
    Plug 'scrooloose/nerdcommenter'
    Plug 'raimondi/delimitmate'
    Plug 'sheerun/vim-polyglot'  " for more language colorscheme support
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemotePlugin') }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'tpope/vim-fugitive'
    " Plug 'scrooloose/syntastic'
    Plug 'w0rp/ale'
    Plug 'airblade/vim-gitgutter'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Python
    Plug 'davidhalter/jedi-vim'

    call plug#end()
    " End plug
" }


""""""""""
" Plugin config {
    " vim-airline {
        set laststatus=2
        let g:airline_theme='solarized'

        let g:airline#extensions#branch#enabled=1
        " let g:airline#extension#syntastic#enabled=1
        let g:airline_powerline_fonts=1

        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled=1
        " Show just the file name
        " let g:airline#extensions#tabline#fnamemod=':t'
    " }


    " NERDTree {
        " nmap <F4> :NERDTreeToggle<CR>
        " nmap <C-n> :NERDTreeToggle<CR>
        noremap <Leader>n :NERDTreeToggle<CR>

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

        let g:NERDTreeWinSize=20
    " }
    " nerdtree-git-plugin {
        let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
                \ }
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

    """ " ctrlp {
    """     let g:ctrlp_map = '<c-p>'
    """     let g:ctrlp_cmd = 'CtrlP'

    """     set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    """     let g:ctrlp_custom_ignore = {
    """         \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    """         \ 'file': '\v\.(exe|so|dll)$',
    """         \ 'link': 'some_bad_symbolic_links',
    """         \ }
    """ "}

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

    " ag.vim {
        " let g:ag_working_path_mode='r'
        " let g:ag_prg="ag --vimgrep --smart-case"  " need Ag 0.25.0
        " let g:ag_format="%f:%l%m"
    " }

    " " ctrlp {
    "     let g:ctrlp_map = '<c-p>'
    "     let g:ctrlp_cmd = 'CtrlP'

    "     set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    "     let g:ctrlp_custom_ignore = {
    "         \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    "         \ 'file': '\v\.(exe|so|dll)$',
    "         \ 'link': 'some_bad_symbolic_links',
    "         \ }
    " "}

     " Tagbar {
        nmap <F8> :TagbarToggle<CR>

        let g:tagbar_width=30
     " }

     " vim-better-whitespace {
        " auto strip whitespace except for file with extention blacklisted
        let blacklist = ['markdown', 'md']
        autocmd BufWritePre * StripWhitespace
     " }

     " delimitMate {
        let delimitMate_expand_inside_quotes = 1
     " }

     " Nerdcommenter {
        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1
        " Use compact syntax for prettified multi-line comments
        let g:NERDCompactSexyComs = 1
        " Align line-wise comment delimiters flush left instead of following code indentation
        let g:NERDDefaultAlign = 'left'
        " Allow commenting and inverting empty lines (useful when commenting a region)
        let g:NERDCommentEmptyLines = 1
        " Enable trimming of trailing whitespace when uncommenting
        let g:NERDTrimTrailingWhitespace = 1
     " }

    " Plug 'octol/vim-cpp-enhanced-highlight'
        let g:cpp_class_scope_highlight = 1
        let g:cpp_experimental_simple_template_highlight = 1
        let g:cpp_concepts_highlight = 1
    " }

    " ALE {
        " enable airline status
        let g:airline#extensions#ale#enabled = 1

        " use quickfix list instead of the loclist
        let g:ale_set_loclist = 0
        let g:ale_set_quickfix = 1
    " }

    " " syntastic recommanded settings {
    "     set statusline+=%#warningmsg#
    "     set statusline+=%{SyntasticStatuslineFlag()}
    "     set statusline+=%*

    "     let g:syntastic_always_populate_loc_list = 1
    "     let g:syntastic_auto_loc_list = 1
    "     let g:syntastic_check_on_open = 0
    "     let g:syntastic_check_on_wq = 0
    " " }

    " {
        " By default syntax-highlighting for Functions,
        " Methods and Structs is disabled.
        " To change it:

        " Python
        let g:syntastic_python_checkers = ['pep8']

        " Syntastic
        let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
        let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

        let g:go_list_type = "quickfix"


    " }

    " jedi-vim {
        " jedi override previous config
        autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
    " }

    " solarized {
        set background=light
        let g:solarized_termcolors=256
        let g:solarized_termtrans = 1  " must set
        " let g:solarized_termcolors=16
        " let g:solarized_visibility = "high"
        " let g:solarized_contrast = "high"
        colorscheme solarized
    " }


" }
""""""""""
