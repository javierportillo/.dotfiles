#!/bin/bash

echo "install oh-my-tmux"
if [ ! -d "$HOME/.local/oh-my-tmux" ]; then
    git clone https://github.com/gpakosz/.tmux.git "$HOME/.local/oh-my-tmux"
fi

ln -s ~/.local/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf

echo "install tmux session wizard script"
if [ ! -f "$HOME/.local/bin/t" ]; then
    curl https://raw.githubusercontent.com/27medkamal/tmux-session-wizard/master/session-wizard.sh > "$HOME/.local/bin/t" && chmod u+x "$HOME/.local/bin/t"
fi

echo "install lf file manager"
if [ ! -f "$HOME/.local/bin/lf" ]; then
    wget -c https://github.com/gokcehan/lf/releases/download/r30/lf-linux-amd64.tar.gz -O - | tar -xz -C "$HOME/.local/bin"
fi

echo "install nvim packer"
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
fi

echo "install telescope dependencies"
npm i -g fd-find
sudo apt install ripgrep

echo "install formatters"
npm i -g prettierd
pip install beautysh

echo "install asdf plugins"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add tmux https://github.com/aphecetche/asdf-tmux.git
asdf plugin add neovim
asdf plugin add kubectx https://github.com/virtualstaticvoid/asdf-kubectx.git
asdf plugin add k9s https://github.com/looztra/asdf-k9s
asdf plugin add zoxide https://github.com/nyrst/asdf-zoxide.git
asdf plugin add awscli

echo "install from .tool-versions"
echo "run asdf install on ~/ at your own risk (it takes long)"
echo "i recommend commenting erlang and elixir and installing later"

echo "Install LaTeX at your own risk (it's heavy, like 3GB download and 6GB on disk)"
echo "Remember to Install a PDF viewer like sumatra"
echo "run sudo apt install texlive-full"

