xmodmap -e "keycode 104 = Enter"

fcitx -d &

# restart dwm
while true; do
  dwmblocks &
  dwm > /dev/null 2>&1
done

