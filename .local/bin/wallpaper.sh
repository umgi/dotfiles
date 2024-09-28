#!/bin/sh
#feh $(cat "$XDG_DATA_HOME/wallpaper/feh_options")


# "$HOME/.fehbg"
#
# exit 0

# magick -size 3200x2000 -define gradient:direction=north -intensity Rec709luminance -colorspace RGB gradient:#f5bfd2-#e5db9c /tmp/bg.png
# hsetroot -full /tmp/bg.png
# exit 0

CHOSEN_BACKGROUND="$(ls /home/emi/.local/share/wallpaper/*.jpg | shuf -n 1)"

# magick "$CHOSEN_BACKGROUND" -blur 0x50 /tmp/wallpaper.png

# feh --no-fehbg -z --bg-max /tmp/wallpaper.png
feh --no-fehbg -z --bg-max "$CHOSEN_BACKGROUND"
exit 0


hsetroot -solid "$(xrdb -query | grep 'desktop.background:' | cut -f 2 | head)"
exit 0
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
convert "$FILE" -resize 640x\> -ordered-dither o2x2,6 -scale 300% "/tmp/bg.$EXTNAME"
hsetroot -cover "/tmp/bg.$EXTNAME"
