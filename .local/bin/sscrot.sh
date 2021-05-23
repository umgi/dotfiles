#!/bin/sh

arg="$1"

year="$(date '+%Y')"
month="$(date '+%m%d')"

dest="$HOME/Pictures/Screenshots/$year/$month"
mkdir -p "$dest"

format='%y%m%d-%H%M%S-$wx$h-scrot.png'
dest="$dest/$format"

case $arg in
  focus ) focus="1" ;;
  picker ) picker="1" ;;
esac

scrot \
  "$dest" \
  ${focus:+-u} \
  ${picker:+-s -f}

notify-send 'sscrot.sh - screenshot saved'
