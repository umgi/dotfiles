dunstArgs="-h string:x-dunst-stack-tag:mytouchpad -u low"
device="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o | head -n1)"

[[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]] &&
  ( xinput disable "$device" && dunstify $dunstArgs "touchpad disabled" ) ||
  ( xinput enable "$device"  && dunstify $dunstArgs "touchpad enabled"  )
