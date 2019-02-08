#!/usr/bin/env bash

herbstclient pad "$1" 25
pkill polybar &> /dev/null
polybar main &



