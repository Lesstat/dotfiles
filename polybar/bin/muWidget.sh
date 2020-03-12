#!/bin/sh

hash mu > /dev/null 2>&1 || exit # leave if notmuch is not present

mails=$(mu find maildir:"/.*Inbox/" 2> /dev/null | wc -l)

if [ "$mails" -gt 0 ]; then
    echo "" 
else
    echo ""
fi	
