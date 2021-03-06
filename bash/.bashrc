#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -d /opt/fsl/lib ]] && export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/fsl/lib"

. /usr/share/git/completion/git-completion.bash
. /usr/share/git/git-prompt.sh

alias ls='ls --color=auto'
alias ll='ls -al'
alias emacs='emacs -nw'
alias sys=systemctl
alias pacman='pacman --color always'

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#PS1='[\u@\h \W]\$ '
