#!/bin/sh

tmpbg=$(mktemp /tmp/XXXXXXX.png)
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
i3lock  -i "$tmpbg"
if [ "${1}" = "-h" ]; then
    systemctl hibernate
else
    systemctl suspend
fi

