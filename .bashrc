#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al'
alias emacs='emacs -nw'
alias sys=systemctl
PS1='[\u@\h \W]\$ '
