" General
filetype plugin on
filetype indent on
set autoread
let mapleader = " "
set clipboard+=unnamedplus
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set nocompatible

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

nnoremap <leader><F8> :source $MYVIMRC<CR>
nnoremap <leader><F9> :source $MYVIMRC<CR>
nnoremap <leader><F10> :PlugInstall<CR>

" close term
map <F1> <C-\><C-n>
