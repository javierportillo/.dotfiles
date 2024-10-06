PS1="READY > "

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/javier/google-cloud-sdk/path.zsh.inc' ]; then . '/home/javier/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/javier/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/javier/google-cloud-sdk/completion.zsh.inc'; fi

# pyenv stuff
# WARN: ENABLE ONLY WHEN USING IT
# This eval is too slow
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Workaround for slowness in pasting text
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Completion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# enables Atuin
eval "$(atuin init zsh --disable-ctrl-r)"

# Start StarShip
eval "$(starship init zsh)"

# Source custom scripts
source "/home/javier/.config/zsh/functions/init.zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Workaround for github stopping the support for svn
# so now I can't use svn ice anymore
setopt RE_MATCH_PCRE   # _fix-omz-plugin function uses this regex style

# Workaround for zinit issue#504: remove subversion dependency. Function clones all files in plugin
# directory (on github) that might be useful to zinit snippet directory. Should only be invoked
# via zinit atclone"_fix-omz-plugin"
_fix-omz-plugin() {
  if [[ ! -f ._zinit/teleid ]] then return 0; fi
  if [[ ! $(cat ._zinit/teleid) =~ "^OMZP::.*" ]] then return 0; fi
  local OMZP_NAME=$(cat ._zinit/teleid | sed -n 's/OMZP:://p')
  git clone --quiet --no-checkout --depth=1 --filter=tree:0 https://github.com/ohmyzsh/ohmyzsh
  cd ohmyzsh
  git sparse-checkout set --no-cone plugins/$OMZP_NAME
  git checkout --quiet
  cd ..
  local OMZP_PATH="ohmyzsh/plugins/$OMZP_NAME"
  local file
  for file in $(ls -a ohmyzsh/plugins/$OMZP_NAME); do
    if [[ $file == '.' ]] then continue; fi
    if [[ $file == '..' ]] then continue; fi
    if [[ $file == '.gitignore' ]] then continue; fi
    if [[ $file == 'README.md' ]] then continue; fi
    if [[ $file == "$OMZP_NAME.plugin.zsh" ]] then continue; fi
    cp -r $OMZP_PATH/$file $file
  done
  rm -rf ohmyzsh
}

## PLUGINS
zinit wait lucid light-mode for \
    OMZP::git \
    OMZP::zoxide \
    OMZL::git.zsh \
    OMZL::history.zsh \
    blockf OMZP::asdf \
    OMZP::alias-finder \
    OMZP::colored-man-pages \
    OMZP::command-not-found \
    atclone"_fix-omz-plugin" OMZP::aliases \
    atclone"_fix-omz-plugin" OMZP::docker-compose

zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"!_zsh_autosuggest_start; \
            bindkey '^f' autosuggest-accept" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions

# For Alias Finder
zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

# KEYBINDS

alias gg="lazygit"
alias ip="ip --color=always"
alias ff='fzf --layout reverse --height ~40% --border --tmux center'

# History
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ALIASES
# kubernetes
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"

# exa
alias ls="exa"
alias ll="exa -lh"
alias la="exa -lah"

# neovim
alias nv="nvim"
alias nk='NVIM_APPNAME="nvim-kickstart" nvim'

# docker
alias dc="docker compose"
alias dclft="docker compose logs -f --tail=10"

# cd to lf last dir
alias lf="lfcd"

# Run fastfetch every open
fastfetch

