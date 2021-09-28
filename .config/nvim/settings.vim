set nocompatible
syntax on
filetype plugin on

set splitbelow " :split to right
set splitright " :vsplit to bottom

set incsearch
set hlsearch

set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

set listchars=eol:%,tab:>\ ,trail:-,extends:>,precedes:<
set list
set colorcolumn=80

set relativenumber
set number

set clipboard+=unnamedplus " use clipboard for yp
set cmdheight=1 " text height
set modeline " file-specific settings: vi:noai:sw=3 ts=6
set shortmess=aT " remove hit-enter prompts & trunc message
