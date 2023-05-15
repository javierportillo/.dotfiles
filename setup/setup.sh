#!/bin/bash
set -e

OHMYZSH_DIR="$HOME/.oh-my-zsh"
CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "change workind dir to home"
cd $HOME

if ! command -v git &> /dev/null; then
	echo "Git is not installed. Aborting."
	exit 1
fi

echo "Installing dependencies"

sudo apt install zsh -y


echo "install oh-my-zsh"

if [ ! -d "$OHMYZSH_DIR" ]; then
	read -p "remember to exit zsh and come back to bash to continue the configuration"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "$OHMYZSH_DIR already exists, skipping..."
fi

echo "install p10k"
echo "https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
read -p "don't forget to install the Meslo font"

if [ ! -d "$OHMYZSH_DIR/custom/themes/powerlevel10k" ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $CUSTOM_DIR/themes/powerlevel10k
fi

