    " Basics ------------------------------------------------------------------- {{{
    set nocompatible        " stop unexpected, sanely reset if re-sourced
    set confirm             " ask to save changes on exit if modified
    set visualbell          " flash when doing something wrong
    syntax on               " syntax highlight

    " when using mouse selection, ignore the line numbers
    set mouse=a

    " determine FileType, then set auto-indent, and load type specific plugins
    filetype indent plugin on

    set wildmenu            " Better command-line completion
    set showcmd             " Show partial commands

    set hlsearch            " Highlight searches
    set incsearch           " show searches as it is typed
    set ignorecase          " case insensitive search
    set smartcase           " case sensitive is starts with caps

    " Allow backspacing over autoindent, line breaks and start of insert action
    set backspace=indent,eol,start

    let mapleader = ","
    let maplocalleader = "\\"
    set t_vb=                   " unset terminal visualbell

    set cmdheight=1             " Set the command window height to 1 line
    set number                  " Display line numbers

    " Quickly time out on keycodes, but never time out on mappings
    set notimeout ttimeout ttimeoutlen=200

    set pastetoggle=<F2>        " avoids weird vim pasting behaviour

    " Stop certain movements from always going to the first character of a line.
    set nostartofline

    set linebreak               " avoid mid-word wraps

    " --- }}}
"
    " Vim-Plug ----------------------------------------------------------------- {{{

    call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'nanotech/jellybeans.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'octol/vim-cpp-enhanced-highlight'

    call plug#end()

    nmap <C-n> :NERDTreeToggle<CR>
    let g:NERDTreeIgnore = ['^node_modules$']

    " ctrlp files to ignore
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

    "let GitGutterLineHighlightsEnable
    " --- }}}
"
    " Color scheme ------------------------------------------------------------- {{{

    set t_Co=256
    set bg=dark
    colorscheme jellybeans      " for terminal only
    set noshowmode

    let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

    " --- }}}
"
    " Customise cursor line ---------------------------------------------------- {{{

    augroup toggleCursorLine
        au!
        au WinLeave,InsertEnter * set nocursorline
        au WinEnter,InsertLeave * set cursorline
    augroup END

    set cursorline

    " --- }}}
"
    " Window options ----------------------------------------------------------- {{{

    set lazyredraw      " redraw screen only when we need to
    set autoread        " reloads changes to files outisde vim

    " --- }}}
"
    " Numbering ---------------------------------------------------------------- {{{

    " Toggle relative numbering, and set to absolute on loss of focus or insert mode
    set relativenumber
    augroup toggleRelativeNumber
        autocmd!
        autocmd FocusGained * set relativenumber
        autocmd FocusLost   * set norelativenumber
        autocmd InsertEnter * set norelativenumber
        autocmd InsertLeave * set relativenumber
    augroup END

    " --- }}}
"
    " Status line -------------------------------------------------------------- {{{

    set laststatus=2                    " Always display the status line
    "set statusline=                     " clear
    "set statusline+=\ %f                " relative path
    "set statusline+=%=                  " right align
    "set statusline+=\ %Y                " file type
    "set statusline+=\ \ L:%l\|          " line number
    "set statusline+=C:%c                " column number
    "set statusline+=\ \ \(%L\ lines\)\  " total lines

    "hi StatusLine ctermbg=Black ctermfg=Grey
    "set title titlestring=%<%F

    "hi LineNr ctermbg=234
    "hi Search cterm=None ctermbg=226 ctermfg=0

    " --- }}}
"
    " Tabs & Indents ----------------------------------------------------------- {{{

    set shiftwidth=4        " 4 spaces for each indent
    set softtabstop=4       " virtual tab space of 4
    set expandtab           " replace tabs with spaces
    set autoindent          " keep same indent as currently on
    set smartindent

    " --- }}}
"
    " Vertical bar (80 char limit) --------------------------------------------- {{{

    set textwidth=80
    set formatoptions=qrn1j
    set colorcolumn=+1
    hi colorcolumn ctermbg=234

    " --- }}}
"
    " Avoid unnecessary file creation ------------------------------------------ {{{

    set nobackup
    set nowritebackup
    set noswapfile

    " --- }}}
"
    " Custom re-mappings ------------------------------------------------------- {{{

    command! Q q                     " typo fixed
    command! W w                     " typo fixed

    " Clean trailing whitespace
    nnoremap <leader>tw mz:%s/\s\+$//<cr>:let @/=''<cr>`z

    " deletes current line in INSERT mode
    inoremap <C-d> <ESC>ddi

    " remove search highlighting, and also from match history
    nnoremap <C-l> :nohl<CR>:call clearmatches()<CR>

    " to open ~/.vimrc on the fly in vertical split
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>

    " to make edits in ~/.vimrc to take immediate effect in current session
    nnoremap <leader>sv :source $MYVIMRC<cr>

    " press `jk` to exit INSERT mode
    inoremap jk <esc>

    " capitalize word in insert mode
    " destroys previous z mark
    inoremap <C-u> <esc>mzgUiw`za

    " change inside braces
    nnoremap ci{ ciB
    " change inside parens
    nnoremap ci( cib

    " --- }}}
"
