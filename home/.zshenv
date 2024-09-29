typeset -U PATH path

export PATH=$HOME/.local/share/bin:$HOME/.config/tmux/plugins/tmux-session-wizard/bin:/usr/local/bin:/snap/bin:$PATH
export LANG=en_US.UTF-8

# clenaup
export LESSHISTFILE="-"

# other
export EDITOR="nvim"
export COLORTERM="truecolor"

. "$HOME/.cargo/env"
