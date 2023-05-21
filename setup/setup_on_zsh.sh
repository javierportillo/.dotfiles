#!/bin/bash

echo "install oh-my-tmux"
if [ ! -d "$HOME/.local/oh-my-tmux" ]; then
    git clone https://github.com/gpakosz/.tmux.git "$HOME/.local/oh-my-tmux"
fi

echo "install tmux session wizard script"
if [ ! -f "$HOME/.local/bin/t" ]; then
    curl https://raw.githubusercontent.com/27medkamal/tmux-session-wizard/master/session-wizard.sh > "$HOME/.local/bin/t" && chmod u+x "$HOME/.local/bin/t"
fi

echo "install nvim packer"
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
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

echo "install formatters"
npm i -g prettierd
pip install beautysh
