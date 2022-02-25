#!/bin/sh

connections=$(nmcli connection show | sed -E '1d; s/--/down/; s/^(.*?\S)  .+  .+  ([^ ]+).+/\2 \1/' | sort)
section=$(printf "%s\\nnet off\nnet on" "$connections" | dmenu -p "nm:")

case $section in
  "net off") nmcli networking off ;;
  "net on") nmcli networking on ;;
  *)
    status=${section%% *}
    conn=${section#* }
    case $status in
      "down")
        nmcli networking on
        nmcli connection up "$conn"
        ;;
      *) nmcli connection down "$conn";;
    esac
    ;;
esac
pkill -RTMIN+4 dwmblocks
