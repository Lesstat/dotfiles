#!/bin/bash

command=$1

class=$(xprop -id $(xdotool getactivewindow) WM_CLASS)

if [[ $class = *emacs* ]]; then
	emacsclient -n -a "" -e "${command}"	
else
	emacsclient -c -n -a "" -e "${command}"	
fi
