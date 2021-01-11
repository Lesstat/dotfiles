# Path to your oh-my-zsh installation.
if [[ -d /usr/share/oh-my-zsh ]]; then
	ZSH=/usr/share/oh-my-zsh/
else
	ZSH=~/.oh-my-zsh/
fi


ZSH_THEME="gnzh"

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"


plugins=(git emacs z)

# User configuration

# If not an interactive shell stop here
[[ $- != *i* ]] && return

[[ -d /opt/fsl/lib ]] && export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/fsl/lib"

alias sys=systemctl
alias pacman='pacman --color always'

if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
bindkey -v
source $ZSH/oh-my-zsh.sh
if (($+commands[exa])) ; then
	unalias ls
	alias ls='exa --git'
fi


(( $+commands[st] )) && export TERMINAL='st'

case $TERM in
	screen*)

        (( $+commands[starship] )) && eval "$(starship init zsh)"

	    precmd(){
		# Restore tmux-title to 'zsh'
		printf "\033kzsh\033\\"
		# Restore st-title to 'zsh'
		print -Pn "\e]2;zsh:%~\a"
	    }

	    preexec(){
		# set tmux-title to running program
		printf "\033k$(echo "$1")\033\\"
		# set st-title to running program
		print -Pn "\e]2;$(echo "$1")\a"
        }
        ;;

	dumb*)
	    unsetopt zle
	    unsetopt prompt_cr
	    unsetopt prompt_subst
	    unfunction precmd
	    unfunction preexec
	    PS1='$ '
	    ;;
esac

alias gdb='gdb -nh -x ${XDG_CONFIG_HOME}/gdb/init'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

bindkey -v

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
