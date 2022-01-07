autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> <leader>fi :OmniSharpFindImplementations<CR>

autocmd FileType cs nnoremap <buffer> <leader><leader> :OmniSharpGetCodeActions<CR>
