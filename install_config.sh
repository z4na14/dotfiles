#! /bin/bash

### Setting up environment ###

# xdg-desktop-portal-hyprland doesn't implement a file pickerm therefore, it is recommended to
# install both xdg-desktop-portal-hyprland and xdg-desktop-portal-gtk

basic_packages = "hyprland wayland xorg-xwayland libinput libva-nvidia-driver nvidia-utils\
	egl-wayland firefox ghostty mako pipewire wireplumber xdg-desktop-portal-hyprland\
	xdg-desktop-portal-gtk qt5-wayland qt6-wayland hyprpolkitagent sddm uwsm libnewt"

required_packages = "playerctl waybar ghostty zsh fastfetch wofi xarchiver thunar unrar swww\
	tumbler mpv keepassxc"

aur_packages = "fsearch qview"

sudo pacman -Syyu $basic_packages
sudo pacman -Syyu $required_packages

# Temporal directory for extracts and installations
rm -fr ./temp
mkdir ./temp


### Install Bibata cursor ###

sudo pacman -S xcur2png # hyprcursor-util dependency

mkdir -p ~/.local/share/icons
tar -xf ./cursors/Bibata-Modern-Ice.tar.xz -C ~/.local/share/icons
tar -xf ./cursors/Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons

hyprcursor-util -x ~/.local/share/icons/Bibata-Modern-Ice -o ./temp
hyprcursor-util -c ./temp/extracted_Bibata-Modern-Ice -o ./temp
mv ./temp/theme_Extracted\ Theme ~/.local/share/icons/Bibata-Modern-Ice-Hyprcursor


### Link and move configurations to their respective places ###

# Move wallpapers to the images folder
ln -s $(pwd)/wallpapers ~/Imágenes/Wallpapers

# Add ghostty default terminal emulator to thunar config
cat ./xfce4/helpers.rc >> ~/.config/xfce4/helpers.rc
