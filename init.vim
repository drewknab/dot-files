call plug#begin(stdpath('config') . '/plugged')
    " colorschemes
    Plug 'dracula/vim'
    Plug 'sonjapeterson/1989.vim'

    " Highlighters
    Plug 'elixir-editors/vim-elixir'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'

    " Power Lines
    Plug 'itchyny/lightline.vim'

    " Tools
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

    " Utilities
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-fugitive'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

call plug#end()

colorscheme dracula
set noswapfile
set backspace=indent,eol,start      " Make backspace behave
let mapleader=' '                   " The default Leader is \
set wildmenu                        " visual autocomplete menu
set lazyredraw                      " redraw only when necessary
set nowrap
set path=+**                        " Bizarre fuzzysearch

" Splits
set splitbelow                      " hsplits default below
set splitright                      " vsplits default right
set laststatus=2
set noshowmode

set mouse=n

" Spaces and Tabs
set tabstop=2                       " Number of spaces per TAB
set softtabstop=2                   " Number of spaces in TAB when editing
set expandtab                       " TABs are spaces
filetype indent on                  " load filetype-specific indent files
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

" Maps
nmap <Leader>ev :tabedit ~/.config/nvim/init.vim<cr>
nmap <Leader>eb :tabedit ~/.bashrc<cr>
nmap <Leader>eg :tabedit ~/.gitconfig<cr>
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

" Lightline
let g:lightline                       = {}
let g:lightline.tab                   = {'active': ['filename', 'modified'], 'inactive': ['filename', 'modified']}
let g:lightline.active                = {
                                        \ 'left': [['mode','paste'],['gitbranch','readonly','filename','modified']],
                                        \ 'right': [['lineinfo'],['CodeStats'],['filetype'],['fileformat'],['percent']]
                                        \}
let g:lightline.tabline               = {'left': [['tabs']], 'right': [['']]}
let g:lightline.colorscheme           = 'dracula'
let g:lightline.component_type        = {'buffers': 'tabsel'}
let g:lightline.component_expand      = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_function    = {'gitbranch': 'FugitiveHead', 'readonly': 'LightlineReadonly', 'CodeStats': 'CodeStatsXp'}

" CodeStats
let g:codestats_api_key = ''

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" CoC Functionality
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Autocmds
augroup autosourcing
	autocmd!
	autocmd BufWritePost init.vim source %
augroup END
