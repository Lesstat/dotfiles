# Path to your oh-my-zsh installation.
if [[ -d /usr/share/oh-my-zsh ]]; then
	ZSH=/usr/share/oh-my-zsh/
else
	ZSH=~/.oh-my-zsh/
fi


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
if hash exa 2> /dev/null; then
	unalias ls
	alias ls='exa --git'
fi

export RUST_SRC_PATH="/home/flo/workspaces/rust/rust/src/"
if [[ -d "$HOME/workspaces/go" ]]; then
    export GOPATH="$HOME/workspaces/go"
    export PATH="${PATH}:${GOPATH}/bin"
fi
if [[ -d "$HOME/.cargo/bin" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export MPD_HOST="/home/flo/.mpd/socket"
export EDITOR='emacsclient -c -nw --alternate-editor=""'
if hash clang 2> /dev/null; then
	export CC="clang"
	export CXX="clang++"
fi

alias emacs=$EDITOR
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

# Python stuff

if [[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]; then
    venvwrapper="/usr/share/virtualenvwrapper/virtualenvwrapper.sh"
elif [[ -f /usr/bin/virtualenvwrapper.sh ]]; then
    venvwrapper="/usr/bin/virtualenvwrapper.sh"
fi

if [[ -n "$venvwrapper" ]]; then
   export WORKON_HOME=~/.virtualenvs
   export VIRTUAL_ENV_DISABLE_PROMPT=1
   source $venvwrapper
   source ~/.virtualenvs/scripting/bin/activate
fi
   

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
