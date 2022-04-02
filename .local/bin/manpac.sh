#!/bin/bash

MANPAC_DIR="$XDG_CONFIG_HOME/manpac"

MANPAC_TMP="$MANPAC_DIR/tmp"
MANPAC_PM="$MANPAC_DIR/pm"
MANPAC_YAY="$MANPAC_DIR/yay"
MANPAC_EXC="$MANPAC_DIR/ignore-$(hostname)"
MANPAC_RM="$MANPAC_DIR/remove"
MANPAC_ONLY="$MANPAC_DIR/only-$(hostname)"


usage() {
  echo "Usage: manpac <action>
    m) merge pacman and yay packages
    p) merge only pacman
    y) merge only yay
    s) sync local packages with list
    sp) sync pacman packages
    sy) sync yay packages
    r) remove packages"
}

merge_pacman() {
  echo "pacman(before): $(cat "$MANPAC_PM" | wc -l)"

  [ ! -f "$MANPAC_ONLY" ] && touch "$MANPAC_ONLY"
  comm -13 <(cat "$MANPAC_ONLY" | sort) \
    <(comm -13 <(cat "$MANPAC_RM" | sort) \
      <(comm <(pacman -Qne | cut -d ' ' -f1 | sort) \
        <(cat "$MANPAC_PM" | sort | uniq | sed '/^\s*$/d'))) \
  | sort | uniq | sponge > "$MANPAC_PM"

  echo "pacman(after): $(cat "$MANPAC_PM" | wc -l)"
}

merge_yay() {
  echo "yay(before): $(cat "$MANPAC_YAY" | wc -l)"

  [ ! -f "$MANPAC_ONLY" ] && touch "$MANPAC_ONLY"
  comm -13 <(cat "$MANPAC_ONLY" | sort) \
    <(comm -13 <(cat "$MANPAC_RM" | sort) \
      <(comm <(pacman -Qme | cut -d ' ' -f1 | sort) \
        <(cat "$MANPAC_YAY" | sort | uniq | sed '/^\s*$/d'))) \
  | sort | uniq | sponge > "$MANPAC_YAY"

  echo "yay(after): $(cat "$MANPAC_YAY" | wc -l)"
}

merge_all() {
  merge_pacman "$@"
  merge_yay "$@"
}

sync_pacman() {
  [ ! -f "$MANPAC_EXC" ] && touch "$MANPAC_EXC"
  [ ! -f "$MANPAC_ONLY" ] && touch "$MANPAC_ONLY"

  MISSED="$( \
    comm <(cat "$MANPAC_ONLY" | sort) \
      <(comm -13 <(cat "$MANPAC_RM" | sort) \
        <(comm -13 <(pacman -Qne | cut -d ' ' -f1 | sort) \
          <(comm -23 "$MANPAC_PM" <(cat "$MANPAC_EXC" | sort)))) \
  )"

  echo "$MISSED" | less
  sudo pacman -Syu --needed $(echo $MISSED | tr "\n" " ")
}


sync_yay() {
  [ ! -f "$MANPAC_EXC" ] && touch "$MANPAC_EXC"
  [ ! -f "$MANPAC_ONLY" ] && touch "$MANPAC_ONLY"

  MISSED="$( \
    comm <(cat "$MANPAC_ONLY" | sort) \
      <(comm -13 <(cat "$MANPAC_RM" | sort) \
        <(comm -13 <(pacman -Qme | cut -d ' ' -f1 | sort) \
          <(comm -23 "$MANPAC_YAY" <(cat "$MANPAC_EXC" | sort)))) \
  )"

  echo "$MISSED" | less
  yay -Syu --needed $(echo $MISSED | tr "\n" " ")
}

sync() {
  sync_pacman "$@"
  sync_yay "$@"
}

remove() {
  sudo pacman -Rsu $(cat "$MANPAC_RM" | cut -d ' ' -f1)
}

main() {
  case "$1" in
    m) instr="merge_all";;
    p) instr="merge_pacman";;
    y) instr="merge_yay";;
    s) instr="sync";;
    sp) instr="sync_pacman";;
    sy) instr="sync_yay";;
    r) instr="remove";;
    *) instr="usage";;
  esac

  $instr "$@"
}

main "$@"

