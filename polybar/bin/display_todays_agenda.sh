#!/bin/sh

notify-send  "Agenda $(date +%y/%m/%d)" "$(khal list today today | tail -n +2)"
