" soon...
" https://icyphox.sh/blog/nvim-lua/
" https://github.com/nanotee/nvim-lua-guide
" https://learnxinyminutes.com/docs/lua/
" https://github.com/savq/paq-nvim/
"
"" auto install plug
if ! filereadable(system('echo -n "$XDG_DATA_HOME/nvim/site/autoload/plug.vim"'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

" remap caps to ctrl but when in combo otherwise escape
" setxkbmap -option "ctrl:nocaps"
" xcape -t 200


call plug#begin('$XDG_DATA_HOME/nvim/plugged')

  Plug 'itchyny/lightline.vim'

  " Plug 'rafi/awesome-vim-colorschemes'
Plug 'mattn/emmet-vim'
  Plug 'evanleck/vim-svelte'
  Plug 'joshdick/onedark.vim'
  Plug 'ghifarit53/tokyonight-vim'
  "Plug 'altercation/vim-colors-solarized'
  Plug 'KeitaNakamura/neodark.vim'
  " Plug 'preservim/nerdtree'

  Plug 'jiangmiao/auto-pairs'
  " Plug 'dyng/ctrlsf.vim'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-commentary'
  Plug 'dominikduda/vim_current_word'
  Plug 'rkitover/vimpager'
    Plug 'vimwiki/vimwiki'

  Plug 'othree/yajs.vim' " not good on performance
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'neoclide/coc.nvim'

  Plug 'junegunn/goyo.vim'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'

  Plug 'baskerville/vim-sxhkdrc'
call plug#end()

" neoclide/coc-tsserver
" neoclide/coc-eslint
" fannheyward/coc-styled-components
" fannheyward/coc-react-refactor


source $XDG_CONFIG_HOME/nvim/fzf.vim
source $XDG_CONFIG_HOME/nvim/vimwiki.vim
source $XDG_CONFIG_HOME/nvim/auto.vim


set nocompatible " idk just on
syntax on
filetype plugin on

set clipboard+=unnamedplus " use clipboard for yp
set cmdheight=1 " text height
set modeline " file-specific settings: vi:noai:sw=3 ts=6
set shortmess=aT
" remove hit-enter prompts & trunc message
set splitbelow " :split to right
set splitright " :vsplit to bottom

" find files
set path+=** " search for file in sub-sub-dirs

command! MakeTags !ctags -R \.

set incsearch
set hlsearch

set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

set autoread " Reload changed files
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime " trigger reload on cursor stop
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl Node


set listchars=eol:%,tab:>\ ,trail:-,extends:>,precedes:<
set list
set colorcolumn=80

" netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:altv=1

" no arrows
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Right> <NOP>
"

" life changer
imap <C-l> <Right>

" Usual tabs
nmap <Tab> >>
nmap <S-Tab> <!-- <<

let mapleader = ","
set timeoutlen=300
let g:user_emmet_leader_key=','

set relativenumber
set number

noremap <F3> :so $MYVIMRC<CR>
noremap <F4> :edit $MYVIMRC<CR>




" nerd tree
" let NERDTreeShowBookmarks = 1
" let NERDTreeShowHidden = 1
" let NERDTreeShowLineNumbers = 1
" let NERDTreeMinimalMenu = 1
" let NERDTreeWinPos = "left"
" let NERDTreeWinSize = 31

" nmap <F1> :NERDTreeFocus<CR>
" nmap <F2> :NERDTreeToggle<CR>
nnoremap <F9> :PlugInstall<CR>

nnoremap <C-d> :echo expand('<cword>')<CR>



nnoremap <C-w>m :
"nnoremap <C-w>,
"nnoremap <C-w>.
tmap <F1> <C-\><C-n> " close term



let g:AutoPairsShortcutToggle = '<C-{>'



" vim_current_word
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1
"hi CurrentWord cterm=underline

" ale
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier'],
  \ 'css': ['prettier'],
  \ 'svelte': ['prettier'],
  \ 'json': ['prettier'],
  \ 'html': ['prettier'],
  \ 'shell': ['shellcheck']
  \ }

let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
"
"
"

" save files as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % > -->/dev/null' <bar> edit!


set autowrite " when changing current file just save without warning

" splitting windows -- usr_08.txt
" resizing
"nnoremap <C-n> :res -5<CR>
"nnoremap <C-m> :res +5<CR>
nnoremap <C-,> :vertical resize -5<CR>
nnoremap <C-.> :vertical resize +5<CR>

"
"nnoremap <C-h> <C-w><C-h>
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-l> <C-w><C-l>

nnoremap <C-o> :tabm +1<CR>
nnoremap <C-p> :tabm -1<CR>

"{count}<C-w> n - hor split {count} pane
"<C-w> q - :q
"<C-w> o - :only
"<C-w> f - split for file under cursor
" <C-w> T - move to new tab
"
" tab left right
" tab shift left right
" inc dec ver size
" inc dec hor size
" vsplit
" termsplit
"

"folding -- check :h usr_28.txt
set foldcolumn=2



" coc
call coc#config('suggest', {
  \ 'timeout': 500
  \})
call coc#config('preferences', {
  \ 'jumpCommand': 'split'
  \})

" jump C
nnoremap <leader> d <Plug>(coc-definition)

"set updatetime=300
"autocmd CursorHold * silent call CocActionAsync('doHover')
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    echo "hi there"
    execute 'h '.expand("<cword>")
  else
    call CocAction('doHover')
  endif
endfunction



set termguicolors
set background=dark
let g:neodark#background = '#111111'
" let g:neodark#terminal_transparent = 1
colorscheme neodark
autocmd ColorScheme * hi Normal cterm=NONE guibg=NONE
autocmd ColorScheme * hi LineNr ctermfg=NONE guifg=NONE
autocmd ColorScheme * hi CursorLineNr ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi FoldColumn ctermbg=NONE guibg=NONE
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'

" set background=light
" let g:gruvbox_bold=1
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'hard'

" set t_ZH=^[[3m
" set t_ZR=^[[23
" colorscheme noelle
