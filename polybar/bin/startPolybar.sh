#!/bin/sh
pkill polybar
for m in $(polybar -m | cut -d":" -f1); do
	MONITOR="${m}" polybar main &
done
