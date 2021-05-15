
setopt PROMPT_SUBST

# colors
autoload -U colors && colors

autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats " %s(%b)"

# prompt
prompt () {
  PS1="%F{red}%n%F{magenta}@%F{yellow}%m%f %F{green}%~%f$vcs_info_msg_1_ $ "
}

precmd_functions+=( vcs_info prompt )


# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

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
bindkey "^f" edit-command-line

[ -f "$XDG_CONFIG_HOME/zsh/aliasrc" ] && source "$XDG_CONFIG_HOME/zsh/aliasrc"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
