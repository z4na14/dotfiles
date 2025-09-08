#! /bin/bash

# Temporal directory for extracts and installations
rm -fr ./temp
mkdir ./temp

### Enable respective services ###

systemctl --user enable --now hyprsunset.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hypridle.service
systemctl --user enable --now NetworkManager.service
systemctl --user enable --now bluetooth

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
Inherits=Bibata-Modern-Ice" >./temp/cursorconf
sudo cp ./temp/cursorconf /usr/share/icons/default/index.theme

### Link and move configurations to their respective places ###

# Move wallpapers to the images folder
ln -s $(pwd)/wallpapers ~/Imágenes/Wallpapers

# Add ghostty default terminal emulator to thunar config
cat ./xfce4/helpers.rc >~/.config/xfce4/helpers.rc

# Add extra arguments to enable custom cursor in Spotify
cat ./spotify-launcher/spotify-launcher.conf >>~/.config/spotify-launcher.conf

# Hide buttons from gtk apps
gsettings set org.gnome.desktop.wm.preferences button-layout :

# Install required fonts
sudo cp ./fonts/* /usr/share/fonts/

# Remove bluetooth applet from running automatically
sed -i 's/^Exec=blueman-applet.*/Exec=/' /etc/xdg/autostart/blueman.desktop

# Add remove and clear history to drun mode
sudo cp clear_history.desktop ~/.local/share/applications/clear_history.desktop

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
