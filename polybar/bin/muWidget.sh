#!/bin/sh

hash mu >/dev/null 2>&1 || exit # leave if mu is not present

mails=$(mu find flag:unread OR maildir:"/.*Inbox/" 2>/dev/null | wc -l)

if [ "$mails" -gt 0 ]; then
	echo ""
else
	echo ""
fi
