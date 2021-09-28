let g:prettier#quickfix_enable = 0
let g:prettier#autoformat_require_pragma = 0

autocmd BufWritePre *.css,*.svelte,*.html,*.ts,*.js,*.json PrettierAsync
