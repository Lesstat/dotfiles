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

export PATH=$HOME/bin:/usr/local/bin:$PATH


[[ $- != *i* ]] && return

[[ -d /opt/fsl/lib ]] && export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/fsl/lib"

alias sys=systemctl
alias pacman='pacman --color always'

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
bindkey -v
source $ZSH/oh-my-zsh.sh
if (($+commands[exa])) ; then
	unalias ls
	alias ls='exa --git'
fi


export RUST_SRC_PATH="$HOME/workspaces/rust/rust/src/"

if [[ -d "$HOME/workspaces/go" ]]; then
    export GOPATH="$HOME/workspaces/go"
    export PATH="${PATH}:${GOPATH}/bin"
fi
if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export MPD_HOST="$HOME/.mpd/socket"

if (( $+commands[st] )); then
    export TERMINAL='st'
fi

if (( $+commands[bat] )); then
    export PAGER='bat'
fi

export EDITOR='emacsclient --alternate-editor "" --create-frame'


if (( $+commands[clang] )); then
	export CC="clang"
	export CXX="clang++"
fi

export QT_AUTO_SCREEN_SCALE_FACTOR=0

#Taskwarrior stuff
alias t=task
alias td='task done'
alias ta='task add'
alias tm='task modify'
alias ttt='task modify wait:tomorrow'

function process_task_inbox(){
    uuids=$(task -TAGGED and +PENDING uuids)
    if [[ -z "${uuids}" ]]; then
	echo "Inbox is empty";
	return
    fi

    tmux split-window -h
    for uuid in ${=uuids}; do
	task $uuid information
	read irrelevant
    done

    count=$(task -TAGGED and +PENDING count)
    echo "Inbox has now ${count} elements"
}

alias tin='process_task_inbox'

function open_projects_file() {
   twpath=$(task _get rc.data.location) 
   if [[ -z $1 ]]; then
       emacsclient -c -n -a "" "${twpath}/projects"
   else
       pro=$1
       emacsclient -c -n -a "" "${twpath}/projects/${pro}.org"
   fi
}
alias tpro='open_projects_file'


case $TERM in
	screen*)
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
esac

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

bindkey -v

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
