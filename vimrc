"""""""""""""""""""""""""
" This is final Zou,Ying vimrc
"""""""""""""""""""""""""


" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win16') || has('win32') || has('win64'))
        endfunction
    " }
	
 	" Basics {
        set nocompatible        " Must be first line
    " }

" } " End Environment



" Use bundles config {
	if filereadable(expand("~/.vimrc.bundles"))
		source ~/.vimrc.bundles
	endif
" } 
"
"
" 
" General {
	filetype plugin indent on	" Automatically detect file types
	syntax on					" Syntax highlighting
	set mouse=a					" Automatically enable mouse usage
	set mousehide				" Hide the mouse cursor while typing

	if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

	set history=1000			" Store a ton of history (default is 20)
	" set spell 					" Spell checking on
	set hidden					" Allow buffer switching whithout saving
    set iskeyword-=.            " '.' is an end of word designator
    set iskeyword-=#            " '#' is an end of word designator
    set iskeyword-=-            " '-' is an end of word designator
" }
"



" Vim UI {
    if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/jellybeans.vim"))
        colorscheme jellybeans    " Load a colorscheme
    endif

    set t_Co=256
    set guioptions-=m               "Remove menu bar
    set guioptions-=T               " Remove toolbar
    "set guioptions-=r              " Remove right-hand scroll bar
    "set guioptions-=L              " Remove right-hand scroll bar
    set guifont=DejaVu\ Sans\ Mono\ 12  " Font

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" }




" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set wrap                        " Wrap lines
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Key mapping / binding {
    let mapleader = ","

" }



" Plugins {

    " NERDTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <F4> :NERDTreeToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeMouseMode=2
            let NERDTreeQuitOnOpen=1
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
        endif
    " }

    " ctrlp {
        if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
            let g:ctrlp_working_path_mode = 'ra'
            
            " shortkey for Mac
            " nnoremap <silent> <D-t> :CtrlP<CR>
            " nnoremap <silent> <D-r> :CtrlPMRU<CR>
            
            let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            " On Windows use "dir" as fallback command.
            if WINDOWS()
                let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
            elseif executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif

            let g:ctrlp_user_command = {
                        \ 'types': {
                        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                        \ },
                        \ 'fallback': s:ctrlp_fallback
                        \ }

            if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
                " CtrlP extensions
                let g:ctrlp_extensions = ['funky']

                "funky
                nnoremap <Leader>fu :CtrlPFunky<Cr>
            endif
        endif
    "}

    " Gundo {
        nnoremap <F5> :GundoToggle<CR>

        " let g:gundo_width = 60
        " let g:gundo_preview_height = 40
        let g:gundo_right = 1

    " }

   "  " Fugitive {
   "      if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
   "          nnoremap <silent> <leader>gs :Gstatus<CR>
   "          nnoremap <silent> <leader>gd :Gdiff<CR>
   "          nnoremap <silent> <leader>gc :Gcommit<CR>
   "          nnoremap <silent> <leader>gb :Gblame<CR>
   "          nnoremap <silent> <leader>gl :Glog<CR>
   "          nnoremap <silent> <leader>gp :Git push<CR>
   "          nnoremap <silent> <leader>gr :Gread<CR>
   "          nnoremap <silent> <leader>gw :Gwrite<CR>
   "          nnoremap <silent> <leader>ge :Gedit<CR>
   "          " Mnemonic _i_nteractive
   "          nnoremap <silent> <leader>gi :Git add -p %<CR>
   "          nnoremap <silent> <leader>gg :SignifyToggle<CR>
   "      endif
   "  "}

" }
