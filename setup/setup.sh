#!/bin/bash
set -e

if ! command -v git &> /dev/null; then
	echo "Git is not installed. Aborting."
	exit 1
fi

echo "Setting up git config user name, email, and default branch to 'main'"
git config --global user.name "Javier Portillo"
git config --global user.email javiermarquezportillo@gmail.com
git config --global init.defaultBranch main
git config --global -l

echo "Installing dependencies"
sudo apt install zsh -y

echo "change workind dir to home"
cd ~/

echo "install oh-my-zsh"
omzsh_dir="$HOME/.oh-my-zsh"
if [ ! -d "$omzsh_dir" ]; then
	read -p "remember to exit zsh and come back to bash to continue the configuration"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "$omzsh_dir already exists, skipping..."
fi

echo "install p10k"
echo "https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
read -p "don't forget to install the Meslo font"
if [ ! -d "$omzsh_dir/custom/themes/powerlevel10k" ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

