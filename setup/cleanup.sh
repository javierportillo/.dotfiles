#!/bin/bash

OHMYZSH_DIR="$HOME/.oh-my-zsh"
CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
DOTFILES_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

echo "change workind dir to home"
cd $HOME

echo "removing stowed files from $DOTFILES_DIR/home"
stow -vv -t $HOME -d $DOTFILES_DIR -D home

echo "Removing p10k"
rm -rf $CUSTOM_DIR/themes/powerlevel10k
rm -rf .p10k.zsh

echo "Removing oh-my-zsh"
rm -rf $OHMYZSH_DIR
rm -f .shell.pre-oh-my-zsh

echo "cleaning up files"
rm -f .zcompdump*
rm -f .zsh_history

echo "Reverting to bash"
chsh -s $(which bash)

