#!/bin/sh

arg="$1"

format='%y%m%d-%H%M%S-$wx$h-scrot.png'
dest="$HOME/Pictures/Screenshots/$format"

case $arg in
  focus ) focus="1" ;;
  picker ) picker="1" ;;
esac

scrot \
  "$dest" \
  ${focus:+-u} \
  ${picker:+-s -f}
