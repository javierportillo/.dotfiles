#!/bin/bash

OHMYZSH_DIR="$HOME/.oh-my-zsh"
CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
DOTFILES_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

read -p "have you already updated the repos?"

echo "Installing dependencies"

sudo apt install git curl zsh stow xdg-user-dirs exa python3-pip fzf

echo "stowing files from $DOTFILES_DIR/home"
stow -vv -t $HOME -d $DOTFILES_DIR -S home

echo "setting locales"
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8

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

echo "install zsh auto suggestions"
if [ ! -d "$CUSTOM_DIR/plugins/zsh-autosuggestions" ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions $CUSTOM_DIR/plugins/zsh-autosuggestions
fi

echo "install zsh syntax highlighting"
if [ ! -d "$CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $CUSTOM_DIR/plugins/zsh-syntax-highlighting
fi

echo "install zsh vi mode"
if [ ! -d "$CUSTOM_DIR/plugins/zsh-vi-mode" ]; then
	git clone https://github.com/jeffreytse/zsh-vi-mode $CUSTOM_DIR/plugins/zsh-vi-mode
fi

echo "install zsh thefuck"
pip install thefuck

echo "install p10k"
echo "https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
read -p "don't forget to install the Meslo font"

if [ ! -d "$OHMYZSH_DIR/custom/themes/powerlevel10k" ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $CUSTOM_DIR/themes/powerlevel10k
fi


echo "install asdf"
if [ ! -d "$HOME/.asdf" ]; then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
fi

echo "dependencies for asdf erlang"
sudo apt install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

echo "from here on, continue on zsh"
chsh -s $(which zsh)

