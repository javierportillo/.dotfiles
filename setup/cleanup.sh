#!/bin/bash

OHMYZSH_DIR="$HOME/.oh-my-zsh"
CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "change workind dir to home"
cd $HOME

echo "Removing p10k"
rm -rf $CUSTOM_DIR/themes/powerlevel10k
rm -rf .p10k.zsh

echo "Removing oh-my-zsh"
rm -rf $OHMYZSH_DIR
rm .shell.pre-oh-my-zsh

echo "Reverting to bash"
chsh -s $(which bash)

echo "Cleaning up zsh config (no need to uninstall)"
rm .zsh*
rm .zcompdump*

echo "cleaning up .gitconfig"
rm .gitconfig

