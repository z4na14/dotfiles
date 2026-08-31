#!/bin/bash


if [[ $# -eq 0 ]]; then
cat << EOF

    Custom script to install all required packages for 
    the dotfiles along minimal utilities that I use everyday, 
    and linking all required files in the respective folders.

    Arguments:
        - "-C": Links all custom configs into the required directories (Idempotent operation).
        - "-P": Install all required packages for the custom dotfiles to work.
        - "-L": Install and configure required options for laptop installs.
        - "-N": Install NVIDIA required packages.
        - "-S": Enable the required services.
        - "-O": Set certain environment options.

EOF

    exit 0
fi


MOVE_CONFIG=false
INSTALL_PACKAGES=false
INSTALL_LAPTOP=false
INSTALL_NVIDIA=false
ENABLE_SERVICES=false
CONFIGURE_OPTS=false

for arg in "$@"; do
    if [[ $arg == "-C" ]]; then
        MOVE_CONFIG=true
    fi

    if [[ $arg == "-P" ]]; then
        INSTALL_PACKAGES=true
    fi

    if [[ $arg == "-L" ]]; then
        INSTALL_LAPTOP=true
    fi

    if [[ $arg == "-N" ]]; then
        INSTALL_NVIDIA=true
    fi

    if [[ $arg == "-S" ]]; then
        ENABLE_SERVICES=true
    fi

    if [[ $arg == "-O" ]]; then
        CONFIGURE_OPTS=true
    fi
done


##############################################################################################
# INSTALL ALL CONFIGS                                                                        #
##############################################################################################
if $MOVE_CONFIG; then

    # ./config folders directly linked
    for dir in "$PWD/config"/*/; do
      name="$(basename "$dir")"
      target="$XDG_CONFIG_HOME/$name"

      rm -rf "$target"
      ln -s "${dir%/}" "$target"
    done

    # Link desktop waybar config
    # (If laptop is used, config is different. See laptop flag)
    ln ~/.config/waybar/config_desktop.jsonc ~/.config/waybar/config.jsonc 

    # Custom cursor
    mkdir temp
    hyprcursor-util -x /usr/share/icons/Bibata-Modern-Ice -o temp
    hyprcursor-util -c temp/Bibata-Modern-Ice -o temp
    sudo mv ./temp/extracted_Bibata-Modern-Ice /usr/share/icons/Bibata-Modern-Ice-Hyprcursor
    rm -rf temp

    # Required GTK theme
    sudo cp -r ./gtk_theme/* /usr/share/themes

    # SDDM theme
    sudo cp -r ./sddm/terminal /usr/share/sddm/themes
    sudo cp ./sddm/sddm.conf /etc/sddm.conf

    # Link zsh config
    ln -s $PWD/zsh/.zshenv ~/
    ln -s $PWD/zsh/.zshrc  ~/

fi
##############################################################################################
# INSTALL ALL PACKAGES                                                                       #
##############################################################################################

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
                gnome-keyring xorg-xhost pqiv yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide \
                resvg imagemagick ffmpegthumbnailer tumbler qt5-quickcontrols qt5-quickcontrols2 \
                qt6-declarative qt6-svg xdg-utils shared-mime-info xdg-desktop-portal seahorse \
                v4l2loopback-dkms perl-image-exiftool senpai"

# Utilities
UTILITY_PACKAGES="obs-studio mpv zathura zathura-pdf-poppler xarchiver unrar \
                  nwg-displays nwg-look qt5ct qt6ct matugen qalculate-qt firefox btop paru \
                  atuin"

# CachyOS specifics
APPS_CACHY="protonup-qt ventoy-bin helium-browser-bin proton-cachyos-slr"

# Normal apps for myself
APPS_BASE="anki obsidian gimp inkscape blender dolphin-emu yt-dlp easytag filezilla keepassxc \
           virt-manager edk2-ovmf swtpm gparted grsync libreoffice-fresh-es nvim tmux gamescope \
           steam qemu-full tenacity claws-mail"

# NVIM dependencies, including linters 
NVIM_DEPS="nodejs npm python python-pip ripgrep fd clang prettier python-black" 

# Laptop (Battery driven devives)
LAPTOP_PACKAGES="brightnessctl tlp iwd impala"

# NVIDIA specifics
NVIDIA_PACKAGES="nvidia-utils lib32-nvidia-utils libva-nvidia-driver"


if $INSTALL_PACKAGES; then
    sudo pacman -Syyu $MAIN_PACKAGES $SHELL_PACKAGES $UTILITY_PACKAGES $APPS_BASE $APPS_CACHY $NVIM_DEPS

    # For apps like obs
    sudo modprobe v4l2loopback exclusive_caps=1 devices=1 video_nr=5 card_label="ExternalWebCam"

fi

if $INSTALL_LAPTOP; then
    sudo pacman -Syyu $LAPTOP_PACKAGES
   
    # Set iwd as wifi backend
    echo -e "[General]\nEnableNetworkConfiguration=true" > /etc/iwd/main.conf
    sudo mkdir -p /etc/NetworkManager/conf.d && echo -e "[device]\nwifi.backend=iwd" | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf
    sudo systemctl enable --now iwd.service

    # Modify copied waybar config to the laptop one
    rm ~/.config/waybar/config.jsonc
    ln ~/.config/waybar/config_laptop.jsonc ~/.config/waybar/config.jsonc
fi

if $INSTALL_NVIDIA; then
    sudo pacman -Syyu $NVIDIA_PACKAGES
fi

##############################################################################################
# ENABLE REQUIRED SERVICES                                                                   #
##############################################################################################
if $ENABLE_SERVICES; then

    systemctl --user enable --now hyprpolkitagent.service
    systemctl --user enable --now waybar.service
    systemctl --user enable --now gnome-keyring-daemon.service
    systemctl enable --now bluetooth.service
    systemctl enable --now NetworkManager.service
    systemctl enable --now sddm.service

fi
##############################################################################################
# VARIOUS SETTINGS                                                                           #
##############################################################################################
if $CONFIGURE_OPTS; then

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

fi
