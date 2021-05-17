" auto install plug
if ! filereadable(system('echo -n "$XDG_DATA_HOME/nvim/site/autoload/plug.vim"'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

" remap caps to ctrl but when in combo otherwise escape
" setxkbmap -option "ctrl:nocaps"
" xcape -t 200


call plug#begin('$XDG_DATA_HOME/nvim/plugged')

  Plug 'rafi/awesome-vim-colorschemes'
  "Plug 'mattn/emmet-vim'
  Plug 'evanleck/vim-svelte'
  Plug 'joshdick/onedark.vim'
  Plug 'ghifarit53/tokyonight-vim'
  "Plug 'altercation/vim-colors-solarized'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'preservim/nerdtree'

  Plug 'jiangmiao/auto-pairs'
  Plug 'dyng/ctrlsf.vim'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-commentary'
  Plug 'dominikduda/vim_current_word'
  Plug 'rkitover/vimpager'
  Plug 'vimwiki/vimwiki'

  Plug 'othree/yajs.vim' " not good on performance
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'neoclide/coc.nvim'

call plug#end()

" neoclide/coc-tsserver
" neoclide/coc-eslint
" fannheyward/coc-styled-components
" fannheyward/coc-react-refactor


set shortmess=at
set cmdheight=2


set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

set autoread " Reload changed files
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime " trigger reload on cursor stop
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl Node

set incsearch
set hlsearch

set splitbelow

set modeline

set listchars=eol:\\,tab:--,trail:.,extends:>,precedes:<
set list

" no arrows
" noremap <Up> <NOP>
" noremap <Left> <NOP>
" noremap <Down> <NOP>
" noremap <Right> <NOP>
"

" life changer
imap <C-l> <Esc>A

" Usual tabs
nmap <Tab> >>
nmap <S-Tab> <<

let mapleader = ","
"let g:user_emmet_leader_key = " "
set timeoutlen=500

set relativenumber
set number

noremap <F3> :so $MYVIMRC<CR>

filetype plugin on
syntax on
set termguicolors
set background=dark
"colorscheme spacecamp
"
autocmd ColorScheme * hi Normal cterm=NONE guibg=NONE
autocmd ColorScheme * hi LineNr ctermfg=NONE guifg=NONE
autocmd ColorScheme * hi CursorLineNr ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi FoldColumn ctermbg=NONE guibg=NONE

let g:neodark#background = '#111111'
let g:neodark#use_256color = 0
let g:neodark#use_custom_terminal_theme = 1
let g:neodark#terminal_transparent = 0
colorscheme neodark



" nerd tree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31

nmap <F1> :NERDTreeFocus<CR>
nmap <F2> :NERDTreeToggle<CR>
nnoremap <F9> :PlugInstall<CR>

nnoremap <C-d> :echo expand('<cword>')<CR>



nnoremap <C-w>m :
"nnoremap <C-w>,
"nnoremap <C-w>.
tmap <F1> <C-\><C-n> " close term



let g:AutoPairsShortcutToggle = '<C-{>'

set splitbelow
set splitright


" vim_current_word
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 1
"hi CurrentWord cterm=underline

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


" xrdb
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" ale
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier'],
  \ 'css': ['prettier'],
  \ 'svelte': ['prettier'],
  \ 'json': ['prettier'],
  \ 'shell': ['shellcheck']
  \ }

let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1

" save files as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" vimwiki
let g:vimwiki_list = [{'path': '~/Documents/vimwiki'}]
let g:vimwiki_autowriteall = 1 " saves file when replacing current window

set autowrite " when changing current file just save without warning

" splitting windows -- usr_08.txt
" resizing
nnoremap <C-n> :res -5<CR>
nnoremap <C-m> :res +5<CR>
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

echo ">^.^<"
