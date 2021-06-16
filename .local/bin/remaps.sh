#!/bin/sh


# Faster long press
xset r rate 300 50

setxkbmap -option "ctrl:nocaps"
xmodmap -e "keycode 255 = Tab"
xmodmap -e "keycode 23 = Super_L"

killall xcape
xcape -t 200 -e "Super_L=Tab;Control_L=Escape"


# Not now

# KP_Enter = Enter
# xmodmap -e "keycode 104 = Return"
# Left_Shift = Shift_Lock
# xmodmap -e 'keycode 50 = Shift_Lock'
# Right_Shift = Shift_Lock
# xmodmap -e 'keycode 62 = Shift_Lock'

# Not working
# Tab = Tab
# Tab + <key> = Super_L + <key>
# xmodmap -e "keycode 133 = Super_L"
# xmodmap -e "keycode 23 = Tab"
# xcape -e "Super_L=Tab" -t $timeout

# Caps_Lock = Escape
# Caps_Lock + <key> = Control_L + <key>
# xmodmap -e "keycode 66 = Control_L"
# xcape -t "200" -e "Control_L=Escape"
