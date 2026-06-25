#!/bin/bash

# Custom script to install all required packages for the dotfiles
# along minimal utilities that I use everyday, and linking all required files
# in the respective folders

INSTALL_PACKAGES=false
INSTALL_UTILS=false
INSTALL_LAPTOP=false
INSTALL_NVIDIA=false
INSTALL_CUSTOM=false

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
        INSTALL_CUSTOM=true
    fi
done

# Main packages
MAIN_PACKAGES="hyprland aquamarine hyprlang hyprcursor hyprutils \
               hyprgraphics hyprshutdown"
SHELL_PACKAGES="kitty zsh mako pipewire-pulse wireplumber uwsm xdg-desktop-portal-hyprland \
                xdg-user-dirs hyprpolkitagent qt5-wayland qt6-wayland ttf-lilex-nerd \
                ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
                waybar awww grim slurp swappy fuzzel cliphist thunar thunar-volman \
                ristretto sddm fastfetch hyprlock hypridle bluez bluez-utils blueman networkmanager \
                nm-connection-editor pavucontrol gvfs gvfs-smb gvfs-mtp gvfs-gphoto2 gvfs-dnssd \
		duf dust bat lsd fzf qt6-virtualkeyboard qt6-imageformats qt5-graphicaleffects"

# Utilities
UTILITY_PACKAGES="obs-studio mpv zathura zathura-pdf-poppler xarchiver unrar \
                  nwg-displays nwg-look qt5ct qt6ct matugen qalculate-qt firefox btop"

# Laptop (Battery driven devives)
LAPTOP_PACKAGES="brightnessctl tlp iwd impala"

# NVIDIA specifics
NVIDIA_PACKAGES="nvidia-utils lib32-nvidia-utils libva-nvidia-driver"

# CachyOS specifics
APPS_CACHY="protonup-qt ventoy-bin vesktop-bin helium-browser-bin proton-cachyos-slr"
# Normal apps for myself
APPS_BASE="anki obsidian gimp inkscape blender dolphin-emu yt-dlp easytag filezilla keepassxc \
           virt-manager edk2-ovmf swtpm gparted grsync libreoffice-fresh-es vim zed gamescope \
           steam thunderbird"


# Install required packages
#
# INSTALL_PACKAGES
# INSTALL_UTILS
# INSTALL_LAPTOP
# INSTALL_NVIDIA
# INSTALL_CUSTOM

if $INSTALL_PACKAGES; then
    pacman -S $MAIN_PACKAGES $SHELL_PACKAGES
fi

if $INSTALL_UTILS; then
    pacman -S $UTILITY_PACKAGES
fi

if $INSTALL_LAPTOP; then
    pacman -S $LAPTOP_PACKAGES
    echo -e "[General]\nEnableNetworkConfiguration=true" > /etc/iwd/main.conf
fi

if $INSTALL_NVIDIA; then
    pacman -S $NVIDIA_PACKAGES
fi

if $INSTALL_CUSTOM; then
    pacman -S $APPS_BASE $APPS_CACHY
fi

# Services
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now waybar.service
systemctl --user enable --now bluetooth.service
systemctl --user enable --now NetworkManager.service

# Install cursor systemwide
#mkdir temp
#hyprcursor-util -x /usr/share/icons/<CURSOR> -o temp
#hyprcursor-util -c temp/<CURSOR> -o temp
#sudo mv ./temp/<CURSOR>_Extracted\ Theme /usr/share/icons/<CURSOR>-Hyprcursor
#rm -rf temp

# Hide buttons from windows
#gsettings set org.gnome.desktop.wm.preferences button-layout :

# Prefer dark settings
#gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Move clear hisotry desktop entry
#sudo cp clear-history.desktop ~/.local/share/applications
