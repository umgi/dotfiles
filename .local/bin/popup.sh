#!/bin/sh
# @depends: setsid mpv feh notify-send sh


size="178x100"
mpv_shift="-20-20"
feh_shift="--100--100"
audio_geom="100x100$mpv_shift"
mpv_fit="150x150"
#''--geometry='$size$feh_shift'

case "$1" in
  video) setsid -f sh -c "mpv --title=popup --autofit-larger='$mpv_fit' --geometry='$mpv_shift' -quiet '$2' --ytdl-raw-options=ignore-config=,sub-lang='ja',write-sub=,write-auto-sub= >~/.cache/popup-mpv.log 2>&1 ; [ $(echo '$?') != '0' ] && notify-send 'popup.sh' 'mpv cant open\n$2'" ;;
  image)
    setsid -f sh -c "feh --title 'popup' --geometry='90x90'  --scale-down '$2' >/dev/null 2>&1 "
    ;;
  audio) setsid -f sh -c "mpv --title=popup --force-window --no-resume-playback --geometry=$audio_geom -quiet '$2' >/dev/null 2>&1 ; [ $(echo '$?') != '0' ] && notify-send 'popup.sh' 'mpv cant open\n$2'" ;;
esac
