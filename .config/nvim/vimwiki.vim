let __wiki = {}
let __wiki.path = '~/.local/share/vimwiki'
let __wiki.path_html = '~/.local/share/vimwiki-html'
let __wiki.ext = '.md'
let __wiki.syntax = 'markdown'
let __wiki.css_name = 'main.css'
let g:vimwiki_list = [__wiki]
let g:vimwiki_autowriteall = 1

let mapleader = ','
nmap <Leader>wl <Plug>VimwikiToggleListItem
vmap <Leader>wl <Plug>VimwikiToggleListItem

autocmd BufWritePost *.md :silent VimwikiAll2HTML!
