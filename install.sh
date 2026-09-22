#!/bin/bash

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
                networkmanager-dmenu nm-connection-editor pavucontrol gvfs gvfs-smb gvfs-mtp gvfs-gphoto2 gvfs-dnssd \
                duf dust bat lsd fzf qt6-virtualkeyboard qt6-imageformats qt5-graphicaleffects \
                gnome-keyring xorg-xhost pqiv yazi ffmpeg 7zip zip unzip jq poppler fd ripgrep fzf zoxide \
                resvg imagemagick ffmpegthumbnailer tumbler qt5-quickcontrols qt5-quickcontrols2 \
                qt6-declarative qt6-svg xdg-utils shared-mime-info xdg-desktop-portal seahorse \
                v4l2loopback-dkms perl-image-exiftool python-jinja python-pillow python-pystray \
                python-pywebview python-pipx less xcur2png dnsmasq pipewire-libcamera \
                sof-firmware alsa-ucm-conf which v4l2loopback-dkms font-manager"

# Utilities
UTILITY_PACKAGES="obs-studio mpv zathura zathura-pdf-poppler xarchiver unrar \
                  nwg-displays nwg-look qt5ct qt6ct matugen qalculate-qt firefox \
                  btop atuin senpai"

# Normal apps for myself
APPS_BASE="anki obsidian gimp inkscape blender yt-dlp easytag filezilla keepassxc \
           libvirt qemu-full virt-manager edk2-ovmf swtpm gparted grsync libreoffice-fresh-es \
           nvim tmux gamescope steam" 

# NVIM dependencies, including linters 
NVIM_DEPS="nodejs npm python python-pip ripgrep fd clang prettier python-black" 

# Laptop (Battery driven devives)
LAPTOP_PACKAGES="brightnessctl tlp wpa_supplicant"

# NVIDIA specifics
NVIDIA_PACKAGES="nvidia-utils lib32-nvidia-utils libva-nvidia-driver"


install_packages () {
    sudo pacman -Syyu $MAIN_PACKAGES    
    sudo pacman -Syyu $SHELL_PACKAGES
    sudo pacman -Syyu $UTILITY_PACKAGES
    sudo pacman -Syyu $APPS_BASE
    sudo pacman -Syyu $NVIM_DEPS
}

install_laptop () {
    sudo pacman -Syyu $LAPTOP_PACKAGES

    # Modify copied waybar config to the laptop one
    rm ~/.config/waybar/config.jsonc
    ln ~/.config/waybar/config_laptop.jsonc ~/.config/waybar/config.jsonc
}

install_nvidia () {
    sudo pacman -Syyu $NVIDIA_PACKAGES
}

##############################################################################################
# ENABLE REQUIRED SERVICES                                                                   #
##############################################################################################
enable_services () {
    systemctl --user enable hyprpolkitagent.service
    systemctl --user enable waybar.service
    systemctl --user enable gnome-keyring-daemon.service
    systemctl --user enable pipewire.service
    systemctl --user enable pipewire-pulse.service
    systemctl --user enable wireplumber.service
    systemctl enable bluetooth.service
    systemctl enable NetworkManager.service
    systemctl enable sddm.service
}

##############################################################################################
# INSTALL ALL CONFIGS                                                                        #
##############################################################################################
move_config () {
    # ./config folders directly linked
    for dir in "$PWD/config"/*/; do
      name=$(basename "$dir")
      target=~/.config/$name

      rm -rf "$target"
      ln -s "${dir%/}" "$target"
    done

    # Link desktop waybar config
    # (If laptop is used, config is different. See laptop flag)
    rm ~/.config/waybar/config.jsonc
    ln ~/.config/waybar/config_desktop.jsonc ~/.config/waybar/config.jsonc 

    sleep 10

    # Custom cursor
    sudo cp -r ./cursor/Bibata-Modern-Ice /usr/share/icons/
    mkdir temp
    hyprcursor-util -x /usr/share/icons/Bibata-Modern-Ice -o temp
    hyprcursor-util -c temp/extracted_Bibata-Modern-Ice -o temp
    sudo rm -rf /usr/share/icons/Bibata-Modern-Ice-Hyprcursor 
    sudo mv ./temp/theme_Extracted\ Theme /usr/share/icons/Bibata-Modern-Ice-Hyprcursor
    rm -rf temp

    # Required GTK theme
    sudo cp -r ./gtk_theme/* /usr/share/themes

    # SDDM theme
    sudo cp -r ./sddm/terminal /usr/share/sddm/themes
    sudo cp ./sddm/sddm.conf /etc/sddm.conf

    # Link zsh config
    rm ~/.zshenv ~/.zshrc
    ln -s $PWD/zsh/.zshenv ~/
    ln -s $PWD/zsh/.zshrc  ~/
}

##############################################################################################
# VARIOUS SETTINGS                                                                           #
##############################################################################################
configure_opts () {
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

    # Create user folders
    xdg-user-dirs-update

    # For apps like obs
    sudo modprobe v4l2loopback exclusive_caps=1 devices=1 video_nr=5 card_label="ExternalWebCam"
 
    # Change shell
    chsh -s $(which zsh)

    # Install oh-my-posh for theme
    curl -s https://ohmyposh.dev/install.sh | bash -s
}

install_aur_helper () {
    sudo pacman -S --needed base-devel
    
    git clone https://aur.archlinux.org/paru.git ~/Downloads/paru
    cd ~/Downloads/paru
    makepkg -si
    cd ~/.dotfiles
}

get_aur_apps () {
    AUR_APPS="millennium zen-browser-bin ungoogled-chromium-bin protonup-qt fsearch"
    paru -Syy $AUR_APPS
}

##############################################################################################
##############################################################################################


if [[ $# -eq 0 ]]; then
cat << EOF

Custom script to install all required packages for 
the dotfiles along minimal utilities that I use everyday, 
and linking all required files in the respective folders.

Arguments:
    -A: Install all in order

    -P: Install all required packages for the custom dotfiles to work.
    -S: Enable the required services.
    -C: Links all custom configs into the required directories (Idempotent operation).
    -L: Install and configure required options for laptop installs.
    -N: Install NVIDIA required packages.
    -O: Set post install requirements.

    -R: Install paru
    -U: Get needed AUR apps
EOF

    exit 0
fi

for arg in "$@"; do
    if [[ $arg == "-P" ]]; then
        install_packages 
    fi

    if [[ $arg == "-S" ]]; then
        enable_services 
    fi

    if [[ $arg == "-C" ]]; then
        move_config
    fi

    if [[ $arg == "-L" ]]; then
        install_laptop 
    fi

    if [[ $arg == "-N" ]]; then
        install_nvidia 
    fi

    if [[ $arg == "-O" ]]; then
        configure_opts
    fi

    if [[ $arg == "-R" ]]; then
        install_aur_helper
    fi

    if [[ $arg == "-U" ]]; then
        get_aur_apps 
    fi
done

