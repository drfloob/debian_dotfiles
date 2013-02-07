XRLINE=`xrandr -q | grep "VGA1"`
if [ "$XRLINE" = "" ]; then
	echo "can't find VGA1"
	exit 1;
fi

CON=`echo "$XRLINE" | grep -E "connected [0-9]+"`
if [ "$CON" = "" ]; then
	xrandr --output VGA1 --mode 1280x1024 --right-of LVDS1
else
	xrandr --output VGA1 --off
fi
