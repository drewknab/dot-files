" Basic Setup

set nocompatible                    " Double down on not being vi
set encoding=utf-8                  " Force a utf-8 encoding

filetype off    " Required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" {{{ Basic Functionality
Plugin 'VundleVim/Vundle.vim'
" }}}

" {{{ Colors
Plugin 'dracula/vim'
" }}}
" 
" {{{ Whizbang Functionality
Plugin 'itchyny/lightline.vim'
" }}}

" {{{ Language Plugins
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'isRuslan/vim-es6'
" }}}

" {{{ tpope power hour
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-capslock'
" }}}

call vundle#end()
filetype plugin indent on

set backspace=indent,eol,start      " Make backspace behave
let mapleader=','                   " The default Leader is \
set wildmenu                        " visual autocomplete menu
set lazyredraw                      " redraw only when necessary
set nowrap
set path=+**                        " Bizarre fuzzysearch

" Splits
set splitbelow                      " hsplits default below
set splitright                      " vsplits default right
set laststatus=2
set noshowmode


" Spaces and Tabs
set tabstop=2                       " Number of spaces per TAB
set softtabstop=2                   " Number of spaces in TAB when editing
set expandtab                       " TABs are spaces
filetype indent on                  " load filetype-specific indent files

" Visuals
syntax enable
set term=xterm-256color
syntax on
colorscheme dracula
set nu                              " Activate line numbers
set rnu                             " Activate relative line numbers
set showcmd                         " Show command in bottom bar
set cursorline                      " Highlight current line
set showmatch                       " highlight matching brackets
hi vertsplit guifg=bg guibg=bg      " hide split border 

" Searching
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches

" MacVim Centric
if has('gui_running')
    colorscheme dracula
    set guioptions-=l               " Remove scrollbars
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=T
    set guioptions-=m
   
    set guifont=Fira_Code:h14       " GUI font
endif

" Mappings

" Easy editing for Vimrc file
nmap <Leader>ev :tabedit ~/.vimrc<cr>
nmap <Leader>t :tabe<cr>
nmap <Leader>v :vsplit<cr>
nmap <Leader>z :split<cr>
nmap <Leader>j <C-w><C-j>
nmap <Leader>k <C-w><C-k>
nmap <Leader>h <C-w><C-h>
nmap <Leader>l <C-w><C-l>
nmap <Leader>ca gg V G              " Select whole buffer
nmap <Leader>cp "+p
nmap <Leader><space> :nohlsearch<cr>

nnoremap zz :q!<cr>
" Add simple highlight removal

" Auto-Commands

" Automatically source Vimrc file on save

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

if ($TERM_PROGRAM =~ "iTerm" || $TERM_PROGRAM =~ "Hyper")
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in NORMAL mode
    let &t_SI = "\<Esc>]5R;CursorShape=1\x7" " Vertical bar in INSERT mode
    let &t_SR = "\<Esc>]50;CursorShape=2\x7" " Underline in REPLACE
endif


let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
