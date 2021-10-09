#!/bin/sh

hsetroot -solid "$(xrdb -query | grep 'desktop.background' | cut -f 2)"


echo "source $XDG_CONFIG_HOME/nvim/schemes/$(xrdb -query | grep 'nvim.scheme' | cut -f 2)" > "$XDG_CONFIG_HOME/nvim/schemes/index.vim"
