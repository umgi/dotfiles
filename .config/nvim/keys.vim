" nnoremap - normal
" inoremap - insert
" vnoremap - visual
" cnoremap - command

let mapleader = "\<Space>"

tmap <F1> <C-\><C-n> " close term

nnoremap <leader>ss :source $MYVIMRC<CR>
nnoremap <leader>se :edit $MYVIMRC<CR>
nnoremap <leader>sp :PlugInstall<CR>

inoremap <C-l> <Right>
" inoremap <C-h> <Left> " not working
