" Basic Setup

set nocompatible                    " Double down on not being vi
set encoding=utf-8                  " Force a utf-8 encoding
set noswapfile

filetype off    " Required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" {{{ Basic Functionality
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jszakmeister/vim-togglecursor'
" }}}

" {{{ Colors
Plugin 'dracula/vim'
Plugin 'sonjapeterson/1989.vim'
" }}}
" 
" {{{ Whizbang Functionality
Plugin 'itchyny/lightline.vim'
Plugin 'mgee/lightline-bufferline'
" }}}

" {{{ Language Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
" }}}

" {{{ tpope power hour
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-capslock'
" }}}

Plugin 'ryanoasis/vim-devicons'
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
colorscheme 1989
set nu                              " Activate line numbers
"set rnu                             " Activate relative line numbers
set showcmd                         " Show command in bottom bar
set cursorline                      " Highlight current line
set showmatch                       " highlight matching brackets
"hi vertsplit guifg=bg guibg=bg          " hide split border 
hi vertsplit ctermfg=NONE ctermbg=NONE  " hide split border 
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
set showtabline=2

" Searching
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches

" MacVim Centric
if has('gui_running')
    colorscheme 1989
    set guioptions=                 " Remove scrollbars
   
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

" if ($TERM_PROGRAM =~ "iTerm" || $TERM_PROGRAM =~ "Hyper" || $TERM_PROGRAM =~ "Apple_Terminal")
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in NORMAL mode
"     let &t_SI = "\<Esc>]5R;CursorShape=1\x7" " Vertical bar in INSERT mode
"     let &t_SR = "\<Esc>]50;CursorShape=2\x7" " Underline in REPLACE
" endif

autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<Leader><Tab>'
let g:user_emmet_settings = {
      \ 'javascript.jsx' : {
      \   'extends': 'jsx',
      \ },
      \ }

let g:lightline                       = {}
let g:lightline.tab                   = {'active': ['filename', 'modified'], 'inactive': ['filename', 'modified']}
let g:lightline.active                = {'left': [['mode','paste'],['gitbranch','readonly','filename','modified']]}
let g:lightline.tabline               = {'left': [['tabs']], 'right': [['']]}
let g:lightline.separator             = { 'left': '', 'right': '' }
"let g:lightline.separator             = { 'left': '', 'right': '' }
"let g:lightline.separator             = { 'left': '', 'right': '' }
"let g:lightline.separator             = { 'left': '', 'right': '' }
let g:lightline.colorscheme           = 'seoul256'
let g:lightline.subseparator             = { 'left': '', 'right': '' }
"let g:lightline.subseparator             = { 'left': '', 'right': '' }
"let g:lightline.subseparator          = { 'left': '', 'right': '' }
"let g:lightline.subseparator          = { 'left': '', 'right': '' }
let g:lightline.component_type        = {'buffers': 'tabsel'}
let g:lightline.component_expand      = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.tabline_separator     = g:lightline.separator
let g:lightline.component_function    = {'gitbranch': 'Fugitive', 'readonly': 'LightlineReadonly', 'filetype': 'MyFiletype', 'fileformat': 'MyFileformat',}
let g:lightline.tabline_subseparator  = g:lightline.subseparator
"
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! Fugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif

    return ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '*'
let g:lightline#bufferline#enable_devicons = 1


