# japanese ime support
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

export ZDOTDIR="$HOME/.config/zsh"

PATH="$HOME/.local/bin/:$PATH"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
