#!/bin/sh

DICTFILE="$HOME/.local/bin/accent-dict/accents.txt"
CLIP="$(xsel --output --primary)" # on select
# CLIP="$(xsel --output --clipboard)" # on copy
CONTENT=$(cat $DICTFILE | grep "$CLIP")
COUNT="$(echo "$CONTENT" | wc -l)"
TITLE="アクセント - $CLIP ($COUNT)"

notify-send "$TITLE" "$(echo "$CONTENT" | head -n 11)"
