require("plugins")
require("opts")
require("maps")
require("auto")

vim.cmd([[
" General
" see .local/bin/remaps.sh
filetype plugin on
filetype indent on
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" setxkbmap -option "ctrl:nocaps"
" xcape -t 200
set autoread " Reload changed files

" vim - manpager
set t_ZH=^[[3m
set t_ZR=^[[23

" close term
map <F1> <C-\><C-n>
]])

vim.cmd([[
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
]])

vim.cmd([[
autocmd BufWritePre *.go lua goimports(1000)
]])
