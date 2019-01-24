#!/bin/bash

now=$(date +%H:%M)
khal list today "${now}" today 23:59 | sed -e "/^[^ ]*day,/d" -e "/↦↔⇥/d" -e "2q" 
