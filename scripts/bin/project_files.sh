#!/usr/bin/env bash

cd $HOME/brain/files
$TERMINAL -e ranger "$(fd -t d . | rg  "/" | dmenu -i)"

