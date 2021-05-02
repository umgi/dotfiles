typeset -U PATH path
path=("$HOME/.bin" "$HOME/.local/bin" "$path[@]")
export PATH

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
