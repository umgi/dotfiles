vim.cmd [[

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime " trigger reload on cursor stop
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl Node

autocmd BufWritePost ~/.config/dwmblocks/config.h !cd ~/.config/dwmblocks/; sudo make install && {killall -q dwmblocks;setsid dwmblocks & }
autocmd BufWritePost ~/.config/dwm/config.h !cd ~/.config/dwm/; sudo make install && {killall -q dwm;setsid dwm & }
autocmd BufWritePost ~/.config/sxhkd/sxhkdrc !{pkill -USR1 sxhkd}
autocmd BufWritePost ~/.config/st/config.h !cd ~/.config/st/; sudo make install
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

"https://stackoverflow.com/questions/72135274/run-gofmt-on-vim-without-plugin
function! GoFmt()
  let saved_view = winsaveview()
  silent %!goimports
  if v:shell_error > 0
    cexpr getline(1, '$')->map({ idx, val -> val->substitute('<standard input>', expand('%'), '') })
    silent undo
    cwindow
  else
    cclose
  endif
  call winrestview(saved_view)
endfunction

command! GoFmt call GoFmt()
augroup go_autocmd
  autocmd BufWritePre *.go GoFmt
augroup END

]]
