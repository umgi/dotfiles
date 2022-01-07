" General
" see .local/bin/remaps.sh
filetype plugin on
filetype indent on
let mapleader = " "
set clipboard+=unnamedplus
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set nocompatible

" setxkbmap -option "ctrl:nocaps"
" xcape -t 200
set autoread " Reload changed files
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime " trigger reload on cursor stop
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl Node

" UI
syntax on
set ruler
set backspace=eol,start,indent
set ignorecase
set smartcase
set incsearch
set lazyredraw
set hlsearch
set magic
set showmatch
set foldcolumn=1
set number
set relativenumber
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set previewheight=10
set laststatus=2
set scrolloff=10
set signcolumn=yes
set splitbelow
set splitright
set list
set listchars=eol:%,tab:>\ ,trail:-,extends:>,precedes:<
set cmdheight=1
set modeline
set shortmess=aT


"Files, backups and undo
set nobackup
set nowb
set noswapfile
set hidden
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
set path+=**
set autowrite

" Text/Indent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set cindent
set nowrap

" Quick fix
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" vim - manpager
set t_ZH=^[[3m
set t_ZR=^[[23

nnoremap <leader><F8> :source $MYVIMRC<CR>
nnoremap <leader><F9> :source $MYVIMRC<CR>
nnoremap <leader><F10> :PlugInstall<CR>

" close term
map <F1> <C-\><C-n>
