#!/bin/bash

now=$(date +%H:%M)
khal list today "${now}" today 23:59 | sed -e "/Today/d" -e "2q" -e "/No events/d"
