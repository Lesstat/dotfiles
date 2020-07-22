# Initialize only once
if [[ -f /usr/bin/startx  &&  "$(tty)" = "/dev/tty1" ]]; then
   pgrep Xorg &> /dev/null || exec startx;
fi

if [[ -z "$TMUX" ]]; then
    tmux a || tmux
fi
