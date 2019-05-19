#!/bin/sh

neo=$(setxkbmap -print | grep neo)

if [ -z "$neo" ]; then
	echo "de"
else 
	echo "neo"
fi
