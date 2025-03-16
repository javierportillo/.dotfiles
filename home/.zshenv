typeset -U PATH path

export PATH=$HOME/.local/share/bin:$HOME/.local/share/scripts:$HOME/.config/tmux/plugins/tmux-session-wizard/bin:/usr/local/bin:/snap/bin:$HOME/.asdf/shims:$PATH
export LANG=en_US.UTF-8

# clenaup
export LESSHISTFILE="-"

# other
export EDITOR="nvim"
export COLORTERM="truecolor"

. "$HOME/.cargo/env"

export COMPOSE_BAKE="true"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

