autocmd BufWritePost ~/.config/dwmblocks/config.h !cd ~/.config/dwmblocks/; sudo make install && {killall -q dwmblocks;setsid dwmblocks & }
autocmd BufWritePost ~/.config/dwm/config.h !cd ~/.config/dwm/; sudo make install && {killall -q dwm;setsid dwm & }
autocmd BufWritePost ~/.config/sxhkd/sxhkdrc !{killall -q sxhkd; setsid -f sxhkd }


" xrdb
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
