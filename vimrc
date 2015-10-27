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
    filetype plugin indent on   " Automatically detect file types
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set history=1000            " Store a ton of history (default is 20)
    " set spell                 " Spell checking on
    set hidden                  " Allow buffer switching whithout saving
    set iskeyword-=.            " '.' is an end of word designator
    set iskeyword-=#            " '#' is an end of word designator
    set iskeyword-=-            " '-' is an end of word designator

    " Always splits to the right and below
    set splitright
    set splitbelow

    " Set to auto read when a file is changed from the outside
    set autoread
" }
"



" Vim UI {
    set t_Co=256

    set guioptions-=m               "Remove menu bar
    set guioptions-=T               " Remove toolbar
    "set guioptions-=r              " Remove right-hand scroll bar
    "set guioptions-=L              " Remove right-hand scroll bar
    " set guifont=DejaVu\ Sans\ Mono\ 12  " Font
    " set guifont=Ubuntu\ Mono\ 14
    set guifont=Inconsolata-dz\ 13

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



"" Replaced by airline
""    if has('statusline')
""        set laststatus=2
""
""        " Broken down into easily includeable segments
""        set statusline=%<%f\                     " Filename
""        set statusline+=%w%h%m%r                 " Options
""        set statusline+=%{fugitive#statusline()} " Git Hotness
""        set statusline+=\ [%{&ff}/%Y]            " Filetype
""        set statusline+=\ [%{getcwd()}]          " Current dir
""        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
""    endif

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

    " set listchars
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    autocmd filetype html,xml,go setlocal nolist
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
" }

" Key mapping / binding {
    let mapleader = ","

    " Move to the next buffer & previous buffer
    nmap <leader>l :bnext<CR>
    nmap <leader>h :bprevious<CR>
    " Close this buffer and move to the previous one
    nmap <leader>bq :bp <BAR> bd #<CR>
" }



" Plugins {

    """ " Colortheme - jellybeans {
    """     let g:jellybeans_use_lowcolor_black = 0
    """     let g:jellybeans_overrides = {
    """         \    'Todo': {  'guifg': '303030', 'guibg': 'f0f000',
    """         \               'ctermfg': 'Black', 'ctermbg': 'Yellow',
    """         \               'attr': 'bold' },
    """         \}
    """ " }

    " Solarized colortheme {
        set background=light
        " set background=dark
        let g:solarized_termtrans=1
        let g:solarized_termcolors=256
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"
        colorscheme solarized
    " }

    " ag {
    "-- In the quickfix window, you can use:
    "--
    "-- e    to open file and close the quickfix window
    "-- o    to open (same as enter)
    "-- go   to preview file (open but maintain focus on ag.vim results)
    "-- t    to open in new tab
    "-- T    to open in new tab silently
    "-- h    to open in horizontal split
    "-- H    to open in horizontal split silently
    "-- v    to open in vertical split
    "-- gv   to open in vertical split silently
    "-- q    to close the quickfix window

    " }


    " ctrlp {
        " F5: Refresh cache
        " <c-f>, <c-b>: Change mode
        " <c-d>: Search file name, NOT path
        " <c-r>: Use regrex
        " <c-j>,<c-k>: UP & DOWN to select file
        " <c-t>,<c-v>,<c-x>: Open file in new tab, or split windows
        " <c-n>,<c-p>: Use before or after search results
        " <c-y>: Create a new file
        " <c-z>: Mark multiple file and use <c-o> to open them.
        "
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

    " neocomplete {
        if isdirectory(expand("~/.vim/bundle/neocomplete.vim/"))
            "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
            " Disable AutoComplPop.
            let g:acp_enableAtStartup = 0
            " Use neocomplete.
            let g:neocomplete#enable_at_startup = 1
            " Use smartcase.
            let g:neocomplete#enable_smart_case = 1
            " Set minimum syntax keyword length.
            let g:neocomplete#sources#syntax#min_keyword_length = 3
            let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

            " Define dictionary.
            let g:neocomplete#sources#dictionary#dictionaries = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }

            " Define keyword.
            if !exists('g:neocomplete#keyword_patterns')
                let g:neocomplete#keyword_patterns = {}
            endif
            let g:neocomplete#keyword_patterns['default'] = '\h\w*'

            " Plugin key-mappings.
            inoremap <expr><C-g>     neocomplete#undo_completion()
            inoremap <expr><C-l>     neocomplete#complete_common_string()

            " Recommended key-mappings.
            " <CR>: close popup and save indent.
            inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
            function! s:my_cr_function()
                return neocomplete#close_popup() . "\<CR>"
                " For no inserting <CR> key.
                return pumvisible() ? neocomplete#close_popup() : "\<CR>"
            endfunction
            " <TAB>: completion.
            inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
            " <C-h>, <BS>: close popup and delete backword char.
            inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
            inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
            inoremap <expr><C-y>  neocomplete#close_popup()
            inoremap <expr><C-e>  neocomplete#cancel_popup()
            " Close popup by <Space>.
            "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

            " For cursor moving in insert mode(Not recommended)
            "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
            "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
            "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
            "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
            " Or set this.
            "let g:neocomplete#enable_cursor_hold_i = 1
            " Or set this.
            "let g:neocomplete#enable_insert_char_pre = 1

            " AutoComplPop like behavior.
            "let g:neocomplete#enable_auto_select = 1

            " Shell like behavior(not recommended).
            "set completeopt+=longest
            "let g:neocomplete#enable_auto_select = 1
            "let g:neocomplete#disable_auto_complete = 1
            "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

            " Enable omni completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

            " Enable heavy omni completion.
            if !exists('g:neocomplete#sources#omni#input_patterns')
                let g:neocomplete#sources#omni#input_patterns = {}
            endif
            "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
            "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
            "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        endif
    " }

"""    " SuperTab {
"""        " let g:SuperTabDefaultCompletionType = "context"
"""
"""        " scroll down the list, NOT navigate the completion menu from bottom
"""        " to top
"""        let g:SuperTabDefaultCompletionType = "<c-n>"
"""        let g:SuperTabContextDefaultCompletionType = "<c-n>"
"""    " }

    " neosnippet {
        " Plugin key-mappings.
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        xmap <C-k> <Plug>(neosnippet_expand_target)
        xmap <C-l> <Plug>(neosnippet_start_unite_snippet_target)

        " SuperTab like snippets' behavior.
        imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)"
                    \: pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)"
                    \: "\<TAB>"

        " Enable snipMate compatibility feature.
        " let g:neosnippet#enable_snipmate_compatibility = 1
    " }

    " vim-airline {
        if isdirectory(expand("~/.vim/bundle/vim-airline/"))
            set laststatus=2

            let g:airline_theme = 'powerlineish'

            " let g:airline_enable_branch     = 1
            " let g:airline_enable_syntastic  = 1
            let g:airline#extensions#branch#enabled = 1
            " let g:airline#extensions#syntastic#enabled = 1

            let g:airline_powerline_fonts = 1
            " set guifont=Inconsolata\ for\ Powerline\ 10

            " if !exists('g:airline_powerline_fonts')
            "     let g:airline_left_sep='›'  " Slightly fancier than '>'
            "     let g:airline_right_sep='‹' " Slightly fancier than '<'
            " else
            "     let g:airline_powerline_fonts = 1
            "     set guifont=Inconsolata\ for\ Powerline\ 16
            " endif

            " Enable the list of buffers
            let g:airline#extensions#tabline#enabled = 1

            " Show just the filename
            let g:airline#extensions#tabline#fnamemod = ':t'

            " let g:airline#extensions#tabline#left_sep = ' '
            " let g:airline#extensions#tabline#left_alt_sep = '|'

        endif
    " }


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


    " Gundo {
        nnoremap <F5> :GundoToggle<CR>

        " let g:gundo_width = 60
        " let g:gundo_preview_height = 40
        let g:gundo_right = 1

    " }


    " Tagbar {
        nmap <F8> :TagbarToggle<CR>
        let g:tagbar_left = 0

        " Support for additional filetypes: https://github.com/majutsushi/tagbar/wiki
        " --- Makefile (targets) ---
        " Addto ~/.ctags:
        "   --regex-make=/^\s*([^#][^:]*):/\1/t,target/
        let g:tagbar_type_make = {
                    \ 'kinds':[
                    \ 'm:macros',
                    \ 't:targets'
                    \ ]
                    \}

        " --- Markdown ---
        " Add to ~/.ctags:
        "   --langdef=markdown
        "   --langmap=markdown:.mkd
        "   --regex-markdown=/^#[ \t]+(.*)/\1/h,Heading_L1/
        "   --regex-markdown=/^##[ \t]+(.*)/\1/i,Heading_L2/
        "   --regex-markdown=/^###[ \t]+(.*)/\1/k,Heading_L3/
        let g:tagbar_type_markdown = {
                    \ 'ctagstype' : 'markdown',
                    \ 'kinds' : [
                    \ 'h:Heading_L1',
                    \ 'i:Heading_L2',
                    \ 'k:Heading_L3'
                    \ ]
                    \ }

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

   " syntastic {
       set statusline+=%#warningmsg#
       set statusline+=%{SyntasticStatuslineFlag()}
       set statusline+=%*

       " Setup syntastic to automatically load errors into the location list
       let g:syntastic_always_populate_loc_list = 1
       " let g:syntastic_auto_loc_list = 1
       " Check errors when a file is loaded. {1: "yes", 0: "no"}
       let g:syntastic_check_on_open = 0
       " Disable - syntastic checks for errors whenever saving the file
       let g:syntastic_check_on_wq = 0

        " Do not automatically jump to the error line when saving file
        let g:syntastic_auto_jump = 0

        " Python checkers
        let g:syntastic_python_checkers=['pep8', 'pylint', 'python']

       let g:syntastic_error_symbol = "✗"
       let g:syntastic_warning_symbol = "⚠"
   " }

    " python-syntax {
        let python_highlight_all = 1
    " }


   """ " python-mode {
   """      " Keys:
   """      " K: Show python docs
   """      " <Ctrl-Space>: autocomplete
   """      " <Ctrl-c>g: goto definition
   """      " <Ctrl-c>d     Rope show documentation
   """      " <Ctrl-c>f     Rope find occurrences
   """      " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
   """      " [[            Jump on previous class or function (normal, visual, operator modes)
   """      " ]]            Jump on next class or function (normal, visual, operator modes)
   """      " [M            Jump on previous class or method (normal, visual, operator modes)
   """      " ]M            Jump on next class or method (normal, visual, operator modes)

   """      let g:pymode_rope = 0   " Use jedi
   """      " let g:pymode_rope = 1

   """      " Documentation
   """      let g:pymode_doc = 1
   """      let g:pymode_doc_key = 'K'

   """      " "Linting
   """      let g:pymode_lint = 1
   """      let g:pymode_lint_checker = "pyflakes,pep8"
   """      " " Auto check on save
   """      let g:pymode_lint_write = 1

   """      " Support virtualenv
   """      let g:pymode_virtualenv = 1

   """      " Enable breakpoints plugin
   """      let g:pymode_breakpoint = 1
   """      let g:pymode_breakpoint_key = '<leader>b'

   """      " syntax highlighting
   """      let g:pymode_syntax = 1
   """      let g:pymode_syntax_all = 1
   """      let g:pymode_syntax_indent_errors = g:pymode_syntax_all
   """      let g:pymode_syntax_space_errors = g:pymode_syntax_all

   """      " Don't autofold code
   """      let g:pymode_folding = 0
   """ " }

   " Jedi {
        " Completion <C-Space>
        " Goto assignments <leader>g (typical goto function)
        " Goto definitions <leader>d (follow identifier as far as possible,
        " includes imports and statements)
        " Show Documentation/Pydoc K (shows a popup with assignments)
        " Renaming <leader>r
        " Usages <leader>n (shows all the usages of a name)
        " Open module, e.g. :Pyimport os (opens the os module)

        " Disable auto-complete on .
        let g:jedi#popup_on_dot = 0
   " }

   " Golang {
        " Highlight
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1

        " By default: vim-go shows errors for the fmt command, to disable it:
        " let g:go_fmt_fail_silently = 1

        " Disable auto fmt on save
        " let g:go_fmt_autosave = 0
   " }
" }
