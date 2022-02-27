#!/bin/bash

exec 2>/dev/null

now=$(date +%H:%M)

command="khal list --notstarted"
while IFS= read -r line 2>/dev/null; do
	command="${command} -d \"${line}\""
done <~/.config/calwidget/ignored_calendars

at_command="khal at 01:00"

while IFS= read -r line 2>/dev/null; do
	at_command="${at_command} -d \"${line}\""
done <~/.config/calwidget/ignored_calendars
events=$(eval "${at_command}" | wc -l)

if ((events > 1)); then
	printf "🌈"
fi

eval "${command}" today "${now}" eod |
	sed -e "/^[^ ]*day,/d" \
		-e "/^[^0-9]/d" \
		-e "/[↦↔⇥]/d" \
		-e "/No events/d" \
		-e "q" |
	cut -c 1-30
echo ""
