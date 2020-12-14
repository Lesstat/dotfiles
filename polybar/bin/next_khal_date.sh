#!/bin/bash

exec 2>/dev/null

now=$(date +%H:%M)

command="khal list"
while IFS= read -r line 2>/dev/null; do
	command="${command} -d \"${line}\""
done <~/.config/calwidget/ignored_calendars

eval "${command}" today "${now}" today 23:59 |
	sed -e "/^[^ ]*day,/d" -e "/[↦↔⇥]/d" -e "/No events/d" -e "2q" |
	cut -c 1-30
echo ""
