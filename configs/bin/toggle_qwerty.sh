#!/bin/bash

QWERTY=$(setxkbmap -print | grep -c colemak)

if [ $QWERTY -eq 0 ]; then
    notify-send "Colemak"
    setxkbmap us colemak
else
    notify-send "QWERTY"
    setxkbmap us
fi
