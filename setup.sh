#!/bin/bash

if ! command -v git &> /dev/null
then
	echo "Git is not installed. Aborting."
	exit 1
fi

echo "Setting up git config user name, email, and default branch to 'main'"
git config --global user.name "Javier Portillo"
git config --global user.email javiermarquezportillo@gmail.com
git config --global init.defaultBranch main
git config --global -l


