let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let mapleader = ","
map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R'

let g:fzf_layout = {
  \ 'up': '~90%',
  \ 'window': {
  \   'width':   0.8,
  \   'height':  0.8,
  \   'yoffset': 0.5,
  \   'xoffset': 0.5,
  \   'highlight': 'Todo',
  \   'border': 'sharp'
  \  }
  \ }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

let g:fzf_colors = {
  \ 'fg': ['fg', 'Normal'],
  \ 'bg': ['bg', 'Normal'],
  \ 'hl': ['fg', 'Comment'],
  \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+': ['fg', 'Statement'],
  \ 'info': ['fg', 'PreProc'],
  \ 'border': ['fg', 'Ignore'],
  \ 'prompt': ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker': ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header': ['fg', 'Comment'],
  \ }
