
export PATH=$HOME/bin:/usr/local/bin:$PATH

[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

if [[ -d "$HOME/workspaces/go" ]]; then
    export GOPATH="$HOME/workspaces/go"
    export PATH="${PATH}:${GOPATH}/bin"
fi

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

export RUST_SRC_PATH="$HOME/workspaces/rust/rust/src/"

export MPD_HOST="$HOME/.config/mpd/socket"
export EDITOR='emacsclient --alternate-editor "" --create-frame'
export QT_AUTO_SCREEN_SCALE_FACTOR=0
