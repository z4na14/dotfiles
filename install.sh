#!/bin/bash

# Custom script to install all required packages for the dotfiles
# along minimal utilities that I use everyday, and linking all required files
# in the respective folders

sudo pacman -Syy

INSTALL_PACKAGES=false
INSTALL_UTILS=false
INSTALL_LAPTOP=false
INSTALL_NVIDIA=false
INSTALL_CUSTOM=false

for arg in "$@"; do
    if [[ $arg == "-P" ]]; then
        INSTALL_PACKAGES=true
    fi

    if [[ $arg == "-U" ]]; then
        INSTALL_UTILS=true
    fi

    if [[ $arg == "-L" ]]; then
        INSTALL_LAPTOP=true
    fi

    if [[ $arg == "-N" ]]; then
        INSTALL_NVIDIA=true
    fi

    if [[ $arg == "-C" ]]; then
        INSTALL_CUSTOM=true
    fi
done

# Main packages
MAIN_PACKAGES="hyprland aquamarine hyprlang hyprcursor hyprutils \
               hyprgraphics hyprshutdown"
SHELL_PACKAGES="kitty zsh mako pipewire-pulse wireplumber uwsm xdg-desktop-portal-hyprland \
                xdg-desktop-portal-gtk xdg-user-dirs hyprpolkitagent qt5-wayland qt6-wayland \
                ttf-lilex-nerd ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji \
                waybar awww grim slurp swappy fuzzel cliphist thunar thunar-volman \
                ristretto sddm fastfetch hyprlock hypridle bluez bluez-utils blueman networkmanager \
                nm-connection-editor pavucontrol gvfs gvfs-smb gvfs-mtp gvfs-gphoto2 gvfs-dnssd \
                duf dust bat lsd fzf qt6-virtualkeyboard qt6-imageformats qt5-graphicaleffects \
                gnome-keyring xorg-xhost vimiv yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide \
                resvg imagemagick ffmpegthumbnailer tumbler qt5-quickcontrols qt5-quickcontrols2 \
                qt6-declarative qt6-svg xdg-utils shared-mime-info xdg-desktop-portal seahorse"

# Utilities
UTILITY_PACKAGES="obs-studio mpv zathura zathura-pdf-poppler xarchiver unrar \
                  nwg-displays nwg-look qt5ct qt6ct matugen qalculate-qt firefox btop"

# Laptop (Battery driven devives)
LAPTOP_PACKAGES="brightnessctl tlp iwd impala"

# NVIDIA specifics
NVIDIA_PACKAGES="nvidia-utils lib32-nvidia-utils libva-nvidia-driver"

# CachyOS specifics
APPS_CACHY="protonup-qt ventoy-bin helium-browser-bin proton-cachyos-slr"
# Normal apps for myself
APPS_BASE="anki obsidian gimp inkscape blender dolphin-emu yt-dlp easytag filezilla keepassxc \
           virt-manager edk2-ovmf swtpm gparted grsync libreoffice-fresh-es nvim tmux gamescope \
           steam thunderbird qemu-full tenacity"

NVIM_DEPS="nodejs npm python python-pip ripgrep fd prettier" 

# Install required packages
#
# INSTALL_PACKAGES
# INSTALL_UTILS
# INSTALL_LAPTOP
# INSTALL_NVIDIA
# INSTALL_CUSTOM

if $INSTALL_PACKAGES; then
    sudo pacman -S $MAIN_PACKAGES $SHELL_PACKAGES
fi

if $INSTALL_UTILS; then
    sudo pacman -S $UTILITY_PACKAGES
fi

if $INSTALL_LAPTOP; then
    sudo pacman -S $LAPTOP_PACKAGES
    echo -e "[General]\nEnableNetworkConfiguration=true" > /etc/iwd/main.conf
    sudo mkdir -p /etc/NetworkManager/conf.d && echo -e "[device]\nwifi.backend=iwd" | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf
    sudo systemctl enable --now iwd.service
fi

if $INSTALL_NVIDIA; then
    sudo pacman -S $NVIDIA_PACKAGES
fi

if $INSTALL_CUSTOM; then
    sudo pacman -S $APPS_BASE $APPS_CACHY $NVIM_DEPS
fi


# Services
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now waybar.service
systemctl --user enable --now gnome-keyring-daemon.service
systemctl enable --now bluetooth.service
systemctl enable --now NetworkManager.service
systemctl enable --now sddm.service


# Install cursor systemwide
mkdir temp
hyprcursor-util -x /usr/share/icons/Bibata-Modern-Ice -o temp
hyprcursor-util -c temp/Bibata-Modern-Ice -o temp
sudo mv ./temp/extracted_Bibata-Modern-Ice /usr/share/icons/Bibata-Modern-Ice-Hyprcursor
rm -rf temp


# GTK settings
# Hide buttons from windows
gsettings set org.gnome.desktop.wm.preferences button-layout :
# Prefer dark settings
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Make Git use libsecret for store
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

# Move clear hisotry desktop entry
sudo cp clear-history.desktop ~/.local/share/applications


# Fix network in libvirt
systemctl enable --now libvirtd.socket
for server in qemud networkd storaged nodedevd secretd nwfilterd; do
    systemctl enable --now virt$server.socket
done
echo 'firewall_backend = "iptables"' | sudo tee /etc/libvirt/network.conf
sudo virsh net-start default
sudo virsh net-autostart default


# Fix xwayland sudo apps
xhost +local:root

