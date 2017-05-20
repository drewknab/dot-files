" Basic Setup
set nocompatible                    " Double down on not being vi
so ~/.vim/plugins.vim

set backspace=indent,eol,start      " Make backspace behave
let mapleader=','                   " The default Leader is \
set wildmenu                        " visual autocomplete menu
set lazyredraw                      " redraw only when necessary
set path=+**                        " Bizarre fuzzysearch

" Splits
set splitbelow                      " hsplits default below
set splitright                      " vsplits default right


nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Spaces and Tabs
set tabstop=4                       " Number of spaces per TAB
set softtabstop=4                   " Number of spaces in TAB when editing
set expandtab                       " TABs are spaces
filetype indent on                  " load filetype-specific indent files

" Visuals
syntax enable
colorscheme atom-dark
set t_CO=256                        " Use 256 colors for Terminal Vim
set number                          " Activate line numbers
set showcmd                         " Show command in bottom bar
set cursorline                      " Highlight current line
set showmatch                       " highlight matching bracketsi
hi vertsplit guifg=bg guibg=bg      " hide split border 

" Searching
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches

" MacVim Centric
if has('gui_running')

    set macligatures                " macvim ligatures

    set guioptions-=l               " Remove scrollbars
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    set guifont=Fira_Code:h17       " MacVim font
    set linespace=10                " MacVim feature
endif

" Mappings

" Easy editing for Vimrc file
nmap <Leader>ev :tabedit ~/.vimrc<cr>

" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

nmap <D-1> :NERDTreeToggle<cr>
nmap <D-p> :CtrlP<cr>


" Auto-Commands

" Automatically source Vimrc file on save

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

