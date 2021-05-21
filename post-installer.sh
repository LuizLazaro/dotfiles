#!/bin/bash
# ADICIONAR:
# - Alguma nerd font

# Test to see if user is running with root privileges.
if [[ "${UID}" -ne 0 ]]
then
	echo 'Must execute with sudo or root' >&2
	exit 1
fi

# Interrupt or continue the installation process
error_msg() {
	read -p "Do you want to continue the installation? > " confirmation

	case "$confirmation" in
		"y"|"Y"|"yes"|"YES") 
			echo "Installing..."
		;;
		"n"|"N"|"no"|"NO")
			echo "Installation Interrupted"
			exit
		;;
		*)
			echo "Invalid Input"
			error_msg
		;;
	esac
}

error_msg

# ====================================================================================
# PACMAN
# ====================================================================================

# Ensure system is up to date
# sudo pacman -Syu --noconfirm
# sudo pacman -S git xorg-server xorg-xrandr xorg-xbacklight xorg-xinit xorg-xrdb xorg-xsetroot xorg-xset bspwm sxhkd os-prober ntfs-3g yarn zsh pulseaudio pulseaudio-alsa stow picom ffmpeg rofi unclutter neofetch neovim libnotify dunst fortune-mod ncmpcpp deluge conky mpv mpd redshift firefox termite gcal anki zathura zathura-djvu zathura-pdf-mupdf ranger gnome-screenshot p7zip unzip unrar fcitx5 fcitx5-mozc fcitx5-gtk fcitx5-table-other fcitx5-table-extra fcitx5-configtool playerctl mopidy --noconfirm

# ====================================================================================
# YAY
# ====================================================================================

# Install yay
# git clone https://aur.archlinux.org/yay.git;
# cd yay || return
# makepkg -si 
# cd - || return

# Install packages
# yay -S pick-colour-picker figma-linux polybar conky-cairo

## pip
#
# pip install pybible-cli

## gem
# 
# gem install colorls

## NVM (Node & npm)
#
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# nvm install node
