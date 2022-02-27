#!/bin/sh
#feh $(cat "$XDG_DATA_HOME/wallpaper/feh_options")
#hsetroot -solid "$(xrdb -query | grep 'desktop.background' | cut -f 2)"

MAIN="$(xrdb -query | grep 'desktop.background1' | cut -f 2)"
SECOND="$(xrdb -query | grep 'desktop.background2' | cut -f 2)"
WP_FOLDER="$XDG_DATA_HOME/wallpaper/"
FILE="$(
  find "$WP_FOLDER" -type f -print0 |
    xargs -0 file --mime-type |
    grep -F 'image/' |
    cut -d ':' -f 1 |
    shuf -n 1 )"
echo "$FILE"
BASENAME="$(basename "$FILE")"
EXTNAME="${BASENAME##*.}"
#hsetroot -add "$MAIN" -add "$SECOND" -gradient 0 -write /tmp/bg.png
convert "$FILE" -resize 640x\> -ordered-dither o8x8,6 -scale 300% "/tmp/bg.$EXTNAME"
hsetroot -cover "/tmp/bg.$EXTNAME"
