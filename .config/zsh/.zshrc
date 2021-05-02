# colors
autoload -U colors && colors

# prompt
PROMPT="%n@%m:%~$ "

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# promptinit
# prompt walters

# vi mode
bindkey -v
export KEYTIMEOUT=1

# vim in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char





autoload edit-command-line; zle -N edit-command-line
bindkey "^e" edit-command-line

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
