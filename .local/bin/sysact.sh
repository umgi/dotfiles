#!/bin/sh

cmds="\
lock		slock
leave dwm	kill -TERM $(pgrep -u $USER "\bdwm$")
renew dwm	kill -HUP $(pgrep -u $USER "\bdwm$")
hibernate	slock ${hib:-systemctl suspend-then-hibernate -i}
reboot	${reb:-sudo -A reboot}
shutdown	${shut:-sudo -A shutdown -h now}
display off 	 xset dpms force off"

choice="$(echo "$cmds" | cut -d'	' -f 1 | dmenu)" || exit 1

`echo "$cmds" | grep "^$choice	" | cut -d '	' -f2-`
