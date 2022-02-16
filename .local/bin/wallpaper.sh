#!/bin/sh
#feh $(cat "$XDG_DATA_HOME/wallpaper/feh_options")
#hsetroot -solid "$(xrdb -query | grep 'desktop.background' | cut -f 2)"

MAIN="$(xrdb -query | grep 'desktop.background1' | cut -f 2)"
SECOND="$(xrdb -query | grep 'desktop.background2' | cut -f 2)"
hsetroot -add "$MAIN" -add "$SECOND" -gradient 0
