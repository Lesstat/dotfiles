export PATH=$HOME/bin:/usr/local/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

[ -d "${XDG_CONFIG_HOME}/emacs/bin" ] && export PATH="${PATH}:${XDG_CONFIG_HOME}/emacs/bin"
[ -d "${HOME}/.local/bin" ] && export PATH="${PATH}:${HOME}/.local/bin"

[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"

(($+commands[sccache])) && export RUSTC_WRAPPER=sccache

export CARGO_TARGET_DIR="${XDG_CACHE_HOME}/cargo-target"
[ -d "${CARGO_TARGET_DIR}" ] || mkdir -p "${CARGO_TARGET_DIR}"

if [[ -d "$HOME/workspaces/go" ]]; then
	export GOPATH="$HOME/workspaces/go"
	export PATH="${PATH}:${GOPATH}/bin"
fi

export MPD_HOST="$HOME/.config/mpd/socket"
export EDITOR='emacsclient --alternate-editor "" --create-frame'
export QT_AUTO_SCREEN_SCALE_FACTOR=0
