typeset -U PATH path

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:/snap/bin:$HOME/.config/tmux/plugins/tmux-session-wizard/bin
export LANG=en_US.UTF-8

# XDG Paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# clenaup
export LESSHISTFILE="-"

# other
export EDITOR="nvim"
export COLORTERM="truecolor"
export GPG_TTY="$(tty)"

. "$HOME/.cargo/env"
