#!/bin/bash

# Root privileges test.
if [[ "${UID}" -ne 0 ]]; then
	echo 'Must execute with sudo or root' >&2
	exit 1
fi

# Internet connection test
if [[ $(ping -c 1 -q google.com >&/dev/null; echo $?) -ne 0 ]]; then
	echo "Please, connect to some network"
	exit 1
fi

# ====================================================================================
# PACMAN
# ====================================================================================

sudo pacman -Syu --noconfirm
sudo pacman -S git xorg-server xorg-xrandr xorg-xbacklight xorg-xinit xorg-xrdb xorg-xsetroot xorg-xset bspwm sxhkd os-prober ntfs-3g yarn zsh pulseaudio pulseaudio-alsa stow ffmpeg rofi unclutter neofetch neovim libnotify dunst fortune-mod ncmpcpp deluge conky mpv mpd redshift firefox termite gcal anki zathura zathura-djvu zathura-pdf-mupdf ranger gnome-screenshot p7zip unzip unrar fcitx5 fcitx5-mozc fcitx5-gtk fcitx5-table-other fcitx5-table-extra fcitx5-configtool playerctl mopidy --noconfirm


# ====================================================================================
# YAY
# ====================================================================================

git clone https://aur.archlinux.org/yay.git
cd yay || return && makepkg -si && cd - || return
yay -S pick-colour-picker figma-linux polybar conky-cairo polybar picom-git


# ====================================================================================
# PIP
# ====================================================================================

pip install pybible-cli


# ====================================================================================
# NVM
# ====================================================================================

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install node

exit 0