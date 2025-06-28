#! /bin/bash

### Setting up environment ###

# xdg-desktop-portal-hyprland doesn't implement a file picker, therefore, it is recommended to
# install both xdg-desktop-portal-hyprland and xdg-desktop-portal-gtk

basic_packages = "hyprland wayland xorg-xwayland libinput libva-nvidia-driver nvidia-utils\
	egl-wayland firefox ghostty mako pipewire wireplumber xdg-desktop-portal-hyprland\
	xdg-desktop-portal-gtk qt5-wayland qt6-wayland hyprpolkitagent sddm uwsm libnewt\
	qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg hypridle hyprlock layer-shell-qt\
	layer-shell-qt5"

required_packages = "playerctl waybar ghostty zsh fastfetch wofi xarchiver thunar unrar swww\
	tumbler mpv keepassxc linux-zen linux-zen-headers hyprsunset cmake meson cpio\
	pkgconf gcc libx11 libxcb libxrender xcb-proto libsecret xorg-xhost code gvfs\
	otf-font-awesome hyprshot hyprpicker cliphist networkmanager nm-connection-editor\
	bluez-utils bluez blueman smbclient gvfs gvfs-smb gvfs-dnssd nss-mdns qalculate-gtk"

aur_packages = "fsearch qview arttime-git vesktop-bin"

sudo pacman -Syyu $basic_packages
sudo pacman -Syyu $required_packages

# Needed for the theme change
sudo pacman -Syy nwg-look qt5ct qt6ct

yay -Syy $aur_packages

# Temporal directory for extracts and installations
rm -fr ./temp
mkdir ./temp


### Enable respective services ###

systemctl --user enable --now hyprsunset.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hypridle.service
systemctl --user enable --now NetworkManager.service


# Remove firewalld applet
sudo mv /etc/xdg/autostart/firewall-applet.desktop /etc/xdg/autostart/firewall-applet.desktop.old

### Install Bibata cursor ###

# hyprcursor-util dependency
sudo pacman -S xcur2png

mkdir -p ~/.local/share/icons
tar -xf ./cursors/Bibata-Modern-Ice.tar.xz -C ~/.local/share/icons
tar -xf ./cursors/Bibata-Modern-Classic.tar.xz -C ~/.local/share/icons

hyprcursor-util -x ~/.local/share/icons/Bibata-Modern-Ice -o ./temp
hyprcursor-util -c ./temp/extracted_Bibata-Modern-Ice -o ./temp
mv ./temp/theme_Extracted\ Theme ~/.local/share/icons/Bibata-Modern-Ice-Hyprcursor
sudo ln -s $HOME/.local/share/icons/Bibata-Modern-Ice /usr/share/icons/Bibata-Modern-Ice

sudo mkdir -p /usr/share/icons/default

echo "[Icon Theme]
Inherits=Bibata-Modern-Ice" > ./temp/cursorconf
sudo cp ./temp/cursorconf /usr/share/icons/default/index.theme

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

# Add remove and clear history to drun mode
sudo cp clear_history.desktop ~/.local/share/applications/clear_history.desktop
sudo cp remove_history.desktop ~/.local/share/applications/remove_history.desktop

# Move cow file
sudo cp ./cowsay /usr/share/cowsay/cows

# Vesktop theme
cp ./vesktop/catppuccin-mocha-sapphire.theme.css ~/.config/vesktop/themes/

# GTK theme
sudo mv ./gtk/theme /usr/share/themes/catppuccin

# Links (NOT EXPECTED TO WORK ON EVERY MACHINE DUE TO PATHS)
ln -s $HOME/Descargas/dotfiles/fastfetch $HOME/.config/fastfetch
ln -s $HOME/Descargas/dotfiles/ghostty $HOME/.config/ghostty
ln -s $HOME/Descargas/dotfiles/gtk/gtk-3.0 $HOME/.config/gtk-3.0
ln -s $HOME/Descargas/dotfiles/gtk/gtk-4.0 $HOME/.config/gtk-4.0
ln -s $HOME/Descargas/dotfiles/hypr $HOME/.config/hypr
ln -s $HOME/Descargas/dotfiles/mako $HOME/.config/mako
ln -s $HOME/Descargas/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/Descargas/dotfiles/qt/qt5ct $HOME/.config/qt5ct
ln -s $HOME/Descargas/dotfiles/qt/qt6ct $HOME/.config/qt6ct
ln -s $HOME/Descargas/dotfiles/spicetify $HOME/.config/spicetify
ln -s $HOME/Descargas/dotfiles/uwsm $HOME/.config/uwsm
ln -s $HOME/Descargas/dotfiles/waybar $HOME/.config/waybar
ln -s $HOME/Descargas/dotfiles/wofi $HOME/.config/wofi
ln -s $HOME/Descargas/dotfiles/zsh/.zshenv $HOME/.zshenv
ln -s $HOME/Descargas/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/Descargas/dotfiles/zsh/oh-my-posh $HOME/.config/oh-my-posh
