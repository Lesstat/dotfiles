export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"
export PATH=$HOME/bin:/usr/local/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"

[ -d "${XDG_CONFIG_HOME}/emacs/bin" ] && export PATH="${PATH}:${XDG_CONFIG_HOME}/emacs/bin"
[ -d "${HOME}/.local/bin" ] && export PATH="${PATH}:${HOME}/.local/bin"

(($+commands[sccache])) && export RUSTC_WRAPPER=sccache

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CARGO_TARGET_DIR="${XDG_CACHE_HOME}/cargo-target"
[ -d "${CARGO_TARGET_DIR}" ] || mkdir -p "${CARGO_TARGET_DIR}"
export PATH="$CARGO_HOME/bin:$PATH"

if [[ -d "$HOME/workspaces/go" ]]; then
	export GOPATH="$HOME/workspaces/go"
	export PATH="${PATH}:${GOPATH}/bin"
fi

export MPD_HOST="$HOME/.config/mpd/socket"
export EDITOR='emacsclient --alternate-editor "" --create-frame'
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export __GL_SHADER_DISK_CACHE_PATH="${XDG_CACHE_HOME}/nv"

export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible/ansible.cfg"

export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator

export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export SSH_AUTH_SOCK=$(gpgconf --list-dirs | rg ssh-socket | cut -d':' -f2)

export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/de.pws; repl $XDG_CONFIG_HOME/aspell/de.prepl"

export LESSHISTFILE=-

export RANDFILE=${XDG_CACHE_HOME}/openssl/rnd

export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export _Z_DATA="$XDG_DATA_HOME/z"
