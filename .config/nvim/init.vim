set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

set incsearch
set hlsearch

set splitbelow

set modeline

set listchars=eol:\\,tab:--,trail:.,extends:>,precedes:<
set list

noremap <Up> <NOP>
noremap <Left> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>


call plug#begin('~/.local/share/nvim/plugged')

  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'mattn/emmet-vim'
  Plug 'evanleck/vim-svelte'
  Plug 'joshdick/onedark.vim'
  Plug 'ghifarit53/tokyonight-vim'
  "Plug 'altercation/vim-colors-solarized'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'preservim/nerdtree'

  Plug 'jiangmiao/auto-pairs'
  Plug 'dyng/ctrlsf.vim'

call plug#end()


let mapleader = ","
let g:user_emmet_leader_key = ","

set relativenumber

noremap <F3> :so $MYVIMRC<CR>

syntax on
set termguicolors
set background=dark
"colorscheme spacecamp
"
let g:neodark#background = '#202020'
colorscheme neodark

" auto-pairs
let g:AutoPairsShortcutToggle = '<C-P>'

" nerd tree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31

nmap <F2> :NERDTreeToggle<CR>


" ctrlsf
let g:ctrlsf_backend = 'ack'
let g:ctrlsf_auto_close = {"normal":0,"compact":0}
let g:ctrlsf_auto_focus = {"at":"start"}
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '46'
let g:ctrlsf_default_root = 'cwd'

nmap <C-f>f :CtrlSFPrompt
"nnoremap <C-f>o :CtrlSFOpen<CR>
nnoremap <C-f>t :CtrlSFToggle<CR>
inoremap <C-f>t <Esc>:CtrlSFToggle<CR>

" autocomplile
autocmd BufWritePost ~/.config/dwmblocks/config.h !cd ~/.config/dwmblocks/; sudo make install && {killall -q dwmblocks;setsid dwmblocks & }
autocmd BufWritePost ~/.config/dwm/config.h !cd ~/.config/dwm/; sudo make install && {killall -q dwm;setsid dwm & }

