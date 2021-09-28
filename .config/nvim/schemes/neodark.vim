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
