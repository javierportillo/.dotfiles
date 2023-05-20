#!/bin/bash
set -e

OHMYZSH_DIR="$HOME/.oh-my-zsh"
CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

DOTFILES_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

echo "Installing dependencies"

sudo apt install git curl zsh stow xdg-user-dirs exa lfm python3-pip

echo "stowing files from $DOTFILES_DIR/home"
stow -vv -t $HOME -d $DOTFILES_DIR -S home

echo "updating xdg dirs"
xdg-user-dirs-update

echo "change workind dir to home"
cd $HOME

echo "install oh-my-zsh"

if [ ! -d "$OHMYZSH_DIR" ]; then
	read -p "remember to exit zsh and come back to bash to continue the configuration"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
else
	echo "$OHMYZSH_DIR already exists, skipping..."
fi

echo "install p10k"
echo "https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
read -p "don't forget to install the Meslo font"

if [ ! -d "$OHMYZSH_DIR/custom/themes/powerlevel10k" ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $CUSTOM_DIR/themes/powerlevel10k
fi

if [ ! -d "$HOME/.asdf" ]; then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
fi


