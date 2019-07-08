#!/bin/sh

notify-send  "Agenda for $(date +"%a %Y/%m/%d")" "$(khal list today today | tail -n +2)"
