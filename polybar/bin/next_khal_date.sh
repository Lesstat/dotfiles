#!/bin/bash

exec 2>/dev/null

now=$(date +%H:%M)

command="khal list"
while IFS= read -r line 2>/dev/null; do
	command="${command} -d \"${line}\""
done <~/.config/calwidget/ignored_calendars
dates=$(eval "${command}" today "${now}" today 23:59)

wholeday=$(
	echo "$dates" | sed -e "/^[^ ]*day,/d" \
		-e "s/^[^0-9].*/📆/" \
		-e "q"
)
printf "${wholeday} "
echo "${dates}" |
	sed -e "/^[^ ]*day,/d" \
		-e "/^[^0-9]/d" \
		-e "/[↦↔⇥]/d" \
		-e "/No events/d" \
		-e "q" |
	cut -c 1-30
echo ""
