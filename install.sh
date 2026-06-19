#!/bin/bash

# Custom script to install all required packages for the dotfiles
# along minimal utilities that I use everyday, and linking all required files
# in the respective folders

INSTALL_PACKAGES=false
INSTALL_UTILS=false
INSTALL_LAPTOP=false
INSTALL_NVIDIA=false
INSTALL_CONFIG=false

for arg in "$@"; do
    if [[ arg == "-P" ]]; then
        INSTALL_PACKAGES=true
    fi

    if [[ arg == "-U" ]]; then
        INSTALL_UTILS=true
    fi

    if [[ arg == "-L" ]]; then
        INSTALL_LAPTOP=true
    fi

    if [[ arg == "-N" ]]; then
        INSTALL_NVIDIA=true
    fi

    if [[ arg == "-C" ]]; then
        INSTALL_CONFIG=true
    fi
done

# Main packages
MAIN_PACKAGES="hyprland aquamarine hyprlang hyprcursor hyprutils \
               hyprgraphics hyprshutdown"
SHELL_PACKAGES="kitty zsh mako pipewire wireplumber uwsm xdg-desktop-portal-hyprland \
                hyprpolkitagent qt5-wayland qt6-wayland ttf-lilex-nerd \
                ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
                waybar awww grim slurp swappy fuzzel cliphist thunar sddm fastfetch"

# Utilities
UTILITY_PACKAGES="obs-studio mpv zathura zathura-pdf-poppler xarchiver unrar \
                  nwg-displays"

# Laptop (Battery driven devives)
LAPTOP_PACKAGES="brightnessctl tlp"

# NVIDIA specifics
NVIDIA_PACKAGES="nvidia-utils lib32-nvidia-utils libva-nvidia-driver"


# Services
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now waybar.service
