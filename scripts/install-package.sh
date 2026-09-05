#!/bin/bash

echo "Select your package-manager."

choosen_package_manager="$(gum choose --limit 1 pacman brew)"
if [[ -z "$choosen_package_manager" ]]; then
	echo "Canceled"
	exit 1
elif [[ "$choosen_package_manager" -eq "pacman" ]]; then
	sudo pacman -S --needed $(cat "./install-packages.txt")
elif [[ "$choosen_package_manager" -eq "brew" ]]; then
	brew install $(cat "../install-packages.txt")
fi
