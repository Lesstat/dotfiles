#!/bin/bash

hash notmuch || exit # leave if notmuch is not present

mails=$(notmuch count tag:unread OR tag:inbox OR tag:unread AND tag:spam )

((mails > 0)) && echo "" || echo ""
