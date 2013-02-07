#!/bin/bash
# myaudioproxy.sh - a proxy for managing various audio utilities from a unified frontend

ALSA_DEV="Master"

######################################################################
# Functions 

function usage {
    echo "myaudioproxy.sh <mute|volup|voldown|play|prev|next|stop>";
}

function alsa_mute {
    amixer set $ALSA_DEV toggle;
    amixer get Master | grep "\[on\]" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
	notify-send "Unmuted";
    else
	notify-send "Muted";
    fi
}

function alsa_volup {
    amixer set $ALSA_DEV playback 5%+;
}

function alsa_voldown {
    amixer set $ALSA_DEV playback 5%-;
}


######################################################################
# Main

if [ $# -eq 0 ]; then
    usage
    exit 1;
fi

case $1 in 
    volup)
	alsa_volup
	;;
    voldown)
	alsa_voldown
	;;
    mute)
	alsa_mute
	;;
    prev|next|play|stop)
	echo "not implemented"
	exit 2;
	;;
esac