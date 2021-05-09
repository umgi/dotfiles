#!/bin/sh

case $BLOCK_BUTTON in
  1) "$TERMINAL" -e nmtui; pkill -RT+4 dwmblocks ;;
  6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac


result="$(cat /sys/class/net/w*/operstate 2> /dev/null)"
wifistatus=""
case "$result" in
  down) wifistatus="" ;;
  up) wifistatus="📶$(awk '/^s*w/ { print int($3 * 100 / 70) }' /proc/net/wireless)" ;;
esac

ethstatus=""
case "$(cat /sys/class/net/e*/operstate 2>/dev/null)" in
  down) ethstatus="" ;;
  up) ethstatus="$(sed "s/down//;s/up/👽/" /sys/class/net/e*/operstate 2>/dev/null)" ;;
esac

[ -z $wifistatus ] && [ -z $ethstatus ] && [ $(nmcli networking) = "enabled" ] && echo "👽" && exit 0

[ -n "$(pidof openvpn)" ] && openvpn="🔒"

printf "%s%s%s\n" $openvpn $wifistatus $ethstatus
