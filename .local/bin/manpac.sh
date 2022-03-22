#!/bin/bash

MANPAC_DIR="$XDG_CONFIG_HOME/manpac"

MANPAC_TMP="$MANPAC_DIR/tmp"
MANPAC_PM="$MANPAC_DIR/pm"
MANPAC_YAY="$MANPAC_DIR/yay"


usage() {
  echo "Usage: manpac <action>
    m) merge pacman and yay packages
    p) merge only pacman
    y) merge only yay
    s) sync local packages with list
    sp) sync pacman packages
    sy) sync yay packages"
}

merge_pacman() {
  echo "pacman(before): $(cat "$MANPAC_PM" | wc -l)"
  pacman -Qn | cut -d ' ' -f1 >> "$MANPAC_PM"
  cat "$MANPAC_PM" | sort | uniq  > "$MANPAC_TMP"
  mv "$MANPAC_TMP" "$MANPAC_PM"
  echo "pacman(after): $(cat "$MANPAC_PM" | wc -l)"
}

merge_yay() {
  echo "yay(before): $(cat "$MANPAC_YAY" | wc -l)"
  pacman -Qm | cut -d ' ' -f1 >> "$MANPAC_YAY"
  cat "$MANPAC_YAY" | sort | uniq  > "$MANPAC_TMP"
  mv "$MANPAC_TMP" "$MANPAC_YAY"
  echo "yay(after): $(cat "$MANPAC_YAY" | wc -l)"
}

merge_all() {
  merge_pacman "$@"
  merge_yay "$@"
}

sync_pacman() {
  HOSTNAME="$(hostname)"
  MISSED="$(comm -2 -3 \
    <(comm -2 -3 "$MANPAC_PM" "$MANPAC_DIR/ignore-$HOSTNAME") \
    <(pacman -Qn | cut -d ' ' -f1 | sort) | tr "\n" " ")"

  sudo pacman -Syu $MISSED
}

sync_yay() {
  HOSTNAME="$(hostname)"
  MISSED="$(comm -2 -3 \
    <(comm -2 -3 "$MANPAC_YAY" "$MANPAC_DIR/ignore-$HOSTNAME") \
    <(pacman -Qm | cut -d ' ' -f1 | sort) | tr "\n" " ")"

  sudo yay -Syu $MISSED
}

sync() {
  sync_pacman "$@"
  sync_yay "$@"
}

main() {
  case "$1" in
    m) instr="merge_all";;
    p) instr="merge_pacman";;
    y) instr="merge_yay";;
    s) instr="sync";;
    sp) instr="sync_pacman";;
    sy) instr="sync_yay";;
    *) instr="usage";;
  esac

  $instr "$@"
}

main "$@"

