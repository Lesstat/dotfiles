#!/bin/bash

if ! which stow &> /dev/null; then
    echo "This script depends on stow"
    echo "On archlinux it can be installed by"
    echo "   sudo pacman -S stow"
    exit 1
fi 

if ! which fd &> /dev/null; then
    echo "This script depends on fd"
    echo "On archlinux it can be installed by"
    echo "   sudo pacman -S fd"
    exit 1
fi 
touch ~/.emacs.d/custom.el #File needs to be existing for emacs config to work
fd -t d -d 1 -x stow -t ~ {} 
