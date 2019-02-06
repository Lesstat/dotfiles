#!/bin/bash

neo=$(setxkbmap -print | ag neo)

if [[ -z "$neo" ]]; then
	setxkbmap de neo
	polybar-msg hook keyboard 1
else 
	setxkbmap de
	polybar-msg hook keyboard 1
fi
