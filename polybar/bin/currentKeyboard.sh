#!/bin/bash

neo=$(setxkbmap -print | ag neo)

if [[ -z "$neo" ]]; then
	echo "de"
else 
	echo "neo"
fi
