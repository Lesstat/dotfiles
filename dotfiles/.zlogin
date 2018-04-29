# Initialize only once
if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval $(ssh-agent)
fi
if [[ -f /usr/bin/startx  &&  "$(tty)" = "/dev/tty1" ]]; then
   pgrep Xorg &> /dev/null || exec startx;
fi
