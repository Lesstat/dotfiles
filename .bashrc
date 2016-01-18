#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. /usr/share/git/completion/git-completion.bash
. /usr/share/git/git-prompt.sh

alias ls='ls --color=auto'
alias ll='ls -al'
alias emacs='emacs -nw'
alias sys=systemctl


export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#PS1='[\u@\h \W]\$ '
