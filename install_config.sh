#! /bin/bash

### Setting up environment ###

# xdg-desktop-portal-hyprland doesn't implement a file picker, therefore, it is recommended to
# install both xdg-desktop-portal-hyprland and xdg-desktop-portal-gtk

basic_packages = "hyprland wayland xorg-xwayland libinput libva-nvidia-driver nvidia-utils\
	egl-wayland firefox ghostty mako pipewire wireplumber xdg-desktop-portal-hyprland\
	xdg-desktop-portal-gtk qt5-wayland qt6-wayland hyprpolkitagent sddm uwsm libnewt\
	qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg hypridle hyprlock"

required_packages = "playerctl waybar ghostty zsh fastfetch wofi xarchiver thunar unrar swww\
	tumbler mpv keepassxc linux-zen linux-zen-headers hyprsunset cmake meson cpio\
	pkgconf gcc libx11 libxcb libxrender xcb-proto libsecret xorg-xhost code gvfs\
	otf-font-awesome hyprshot hyprpicker cliphist networkmanager nm-connection-editor\
	bluez-utils bluez blueman"

aur_packages = "fsearch qview"

# For changing theme, uncomment the following apps
# sudo pacman -S nwg-look qt5ct qt6ct


sudo pacman -Syyu $basic_packages
sudo pacman -Syyu $required_packages

# Temporal directory for extracts and installations
rm -fr ./temp
mkdir ./temp


### Enable respective services ###

sudo systemctl --user enable --now hyprsunset.service
sudo systemctl --user enable --now hyprpolkitagent.service
sudo systemctl --user enable --now hypridle.service
sudo systemctl --user enable --now NetworkManager.service


# Remove firewalld applet
sudo mv /etc/xdg/autostart/firewall-applet.desktop /etc/xdg/autostart/firewall-applet.desktop.old

### Install Bibata cursor ###

sudo pacman -S xcur2png # hyprcursor-util dependency

mkdir -p ~/.local/share/icons
tar -xf ./cursors/Bibata-Modern-Ice.tar.xz -C ~/.local/share/icons
tar -xf ./cursors/Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons

hyprcursor-util -x ~/.local/share/icons/Bibata-Modern-Ice -o ./temp
hyprcursor-util -c ./temp/extracted_Bibata-Modern-Ice -o ./temp
mv ./temp/theme_Extracted\ Theme ~/.local/share/icons/Bibata-Modern-Ice-Hyprcursor
sudo ln -s $HOME/.local/share/icons/Bibata-Modern-Ice /usr/share/icons/Bibata-Modern-Ice

sudo mkdir -p /usr/share/icons/default

echo "[Icon Theme]
Inherits=Bibata-Modern-Ice" > /usr/share/icons/default/index.theme

### Link and move configurations to their respective places ###

# Move wallpapers to the images folder
ln -s $(pwd)/wallpapers ~/Imágenes/Wallpapers

# Add ghostty default terminal emulator to thunar config
cat ./xfce4/helpers.rc >> ~/.config/xfce4/helpers.rc

# Add extra arguments to enable custom cursor in Spotify
cat ./spotify-launcher/spotify-launcher.conf >> ~/.config/spotify-launcher.conf

# Hide buttons from gtk apps
gsettings set org.gnome.desktop.wm.preferences button-layout :

# Install required fonts
sudo cp ./fonts/* /usr/share/fonts/

# Remove bluetooth applet from running automatically
sed -i 's/^Exec=blueman-applet.*/Exec=/' ~/.config/autostart/blueman.desktop

