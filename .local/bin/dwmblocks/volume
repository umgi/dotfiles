#!/bin/sh

case $BLOCK_BUTTON in
  1) setsid -f "$TERMINAL" -e ncpamixer ;;
  2) pamixer -t ;;
  4) pamixer --allow-boost -i 1 ;;
  5) pamixer --allow-boost -d 1 ;;
  6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
	icon="🔊"
elif [ "$vol" -lt "20" ]; then
	icon="🔈"
else
	icon="🔉"
fi

[ $(pamixer --get-mute) = true ] && icon="🔇"

echo "$icon$vol"
