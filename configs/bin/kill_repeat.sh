#!/bin/bash

LOCK='/tmp/killrepeat.lock'

if [ -f "$LOCK" ]; then
    MSG="repeat enaaaaaaaaaaabled";
    rm $LOCK;
    xset r rate 150 100
else
    MSG="repeat disabled";
    touch $LOCK;
    xset r off
fi

zenity --info --timeout=1 --text "$MSG"