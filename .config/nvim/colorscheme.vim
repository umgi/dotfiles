function! s:Noelle()
  set background=light
  let g:gruvbox_bold=1
  let g:gruvbox_italic=1
  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_contrast_light='hard'
  colorscheme noelle
endfunction

function! s:OneHalfDark()
  colorscheme onehalfdark
  let g:airline_theme = 'onehalfdark'
  set background=dark
  hi! Normal guibg=NONE ctermbg=NONE
endfunction

function! s:FairyGarden()
  set background=light
  colorscheme fairy-garden
endfunction

function! ToggleTheme()
  if &background == 'dark'
    call s:FairyGarden()
  else
    call s:OneHalfDark()
  endif
endfunction

nnoremap <leader><F7> :call ToggleTheme()<CR>
call s:OneHalfDark()
