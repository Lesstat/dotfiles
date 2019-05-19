#!/bin/sh

hash notmuch > /dev/null 2>&1 || exit # leave if notmuch is not present

mails=$(notmuch count tag:unread OR tag:inbox OR tag:unread AND tag:spam )

if [ "$mails" -gt 0 ]; then
    echo "" 
else
    echo ""
fi	
