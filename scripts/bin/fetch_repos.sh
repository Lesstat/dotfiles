#!/bin/bash

PARENT_DIR=$1

function fetchpull() {
	DIR=$(
		cd "$1/../.." || exit
		echo "${PWD}"
	)
	if ! git -C "${DIR}" fetch --all &>/dev/null; then
		echo "could not fetch ${DIR}"
		exit 1
	fi

	if ! git -C "${DIR}" pull --ff-only &>/dev/null; then
		echo "could not pull ${DIR}"
	fi
}

export -f fetchpull

if which fd &>/dev/null; then
	fd -HI -t d --full-path "\.git/refs/remotes$" -E emacs "${PARENT_DIR}" -x bash -c "fetchpull {//}"
else
	find "${PARENT_DIR}" -type d -path "*.git/refs/remotes" -exec bash -c "fetchpull {}" \;
fi
