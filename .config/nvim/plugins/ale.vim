let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier'],
  \ 'css': ['prettier'],
  \ 'svelte': ['prettier'],
  \ 'json': ['prettier'],
  \ 'html': ['prettier'],
  \ 'shell': ['shellcheck']
  \ }

let ale_linters = {
  \ 'cs': ['OmniSharp'],
  \ }

let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
