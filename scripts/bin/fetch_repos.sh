#!/bin/bash

PARENT_DIR=$1

function fetchpull() {
    if ! git -C "$1" fetch --all &> /dev/null ; then
	echo "could not fetch ${1}"
    fi
    
    if ! git -C "$1" pull --ff-only &> /dev/null; then
	echo "could not pull ${1}"
    fi
}

export -f  fetchpull

if which fd &> /dev/null ; then
    fd -HI -t d "^\.git$" "${PARENT_DIR}" -x  bash -c "fetchpull {//}"
else				
    find "${PARENT_DIR}" -type d -name .git -exec bash -c "fetchpull {}" \;
fi
