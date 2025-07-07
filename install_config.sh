#! /bin/bash

### Setting up environment ###

# xdg-desktop-portal-hyprland doesn't implement a file picker, therefore, it is recommended to
# install both xdg-desktop-portal-hyprland and xdg-desktop-portal-gtk

# Basic packages
sudo pacman -Syyu hyprland wayland xorg-xwayland libinput libva-nvidia-driver nvidia-utils \
egl-wayland firefox ghostty mako pipewire wireplumber xdg-desktop-portal-hyprland \
xdg-desktop-portal-gtk qt5-wayland qt6-wayland hyprpolkitagent sddm uwsm libnewt \
qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg hypridle hyprlock layer-shell-qt \
layer-shell-qt5

# Required packages
sudo pacman -Syyu playerctl waybar ghostty zsh fastfetch wofi xarchiver thunar unrar swww \
tumbler mpv keepassxc linux-zen linux-zen-headers hyprsunset cmake meson cpio \
pkgconf gcc libx11 libxcb libxrender xcb-proto libsecret xorg-xhost code gvfs \
ttf-font-awesome hyprshot hyprpicker cliphist networkmanager nm-connection-editor \
bluez-utils bluez blueman smbclient gvfs gvfs-smb gvfs-dnssd nss-mdns qalculate-gtk \
gnome-font-viewer cowsay

yay -Syy fsearch qview arttime-git vesktop-bin

# Needed for the theme change
sudo pacman -Syy nwg-look qt5ct qt6ct
