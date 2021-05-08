#!/bin/sh

# based on changed version of mpvSockets -- just add spawn time to socket file name
# dependency: mpvSockets, socat, grep

socket=$(ls /tmp/mpvSockets | sort | tail -n 1)
[ -z $socket ] && exit 0

filepath="/tmp/mpvSockets/$socket"

status=$(echo '{"command":["get_property_string", "pause"]}' | socat - $filepath | grep -Eo "yes|no")

case $status in
  yes) send="false" ;;
  no) send="true" ;;
  *) exit 0;;
esac

echo "{\"command\": [\"set_property\", \"pause\", $send]}" | socat - $filepath
