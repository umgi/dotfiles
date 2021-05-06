#!/bin/sh

case $BLOCK_BUTTON in
  4) xbacklight -inc 10 ;;
  5) xbacklight -dec 10 ;;
  6) "$TERMINAL" -e "$EDITOR" "$0"
esac

count="$(ls /sys/class/power_supply | grep "BAT*" | wc -w)"

[ "$count" = "0" ] && exit 0

for battery in /sys/class/power_supply/BAT?*; do
  [ -n "${capacity+x}" ] && printf " "

  case "$(cat "$battery/status")" in
    "Full") status="⚡" ;;
    "Discharging") status="🔋" ;;
    "Charging") status="🔌" ;;
    "Not charging") status="🛑" ;;
    "Unknown") status="♻️" ;;
  esac

  capacity=$(cat "$battery/capacity")
  [ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"

  printf "%s%d%s" "$status" "$capacity" "$warn"; unset warn

done && exit 0
