#!/bin/sh

command=$1

class=$(xprop -id "$(xdotool getactivewindow)" WM_CLASS)


case "$class" in 
    *emacs*)
	emacsclient -n -a "" -e "${command}"	
	;;
    *)
	emacsclient -c -n -a "" -e "${command}"	
	;;
esac
