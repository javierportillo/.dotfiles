#!/bin/bash

echo "install oh-my-tmux"
if [ ! -d "$HOME/.local/oh-my-tmux" ]; then
	git clone https://github.com/gpakosz/.tmux.git ~/.local/oh-my-tmux
fi

ln -s ~/.local/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf

echo "install asdf plugins"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add tmux https://github.com/aphecetche/asdf-tmux.git
asdf plugin add neovim
asdf plugin add kubectx https://github.com/virtualstaticvoid/asdf-kubectx.git
asdf plugin add k9s https://github.com/looztra/asdf-k9s
asdf plugin add zoxide https://github.com/nyrst/asdf-zoxide.git

echo "install from .tool-versions"
#asdf install

