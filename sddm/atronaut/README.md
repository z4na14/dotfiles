https://github.com/Keyitdev/sddm-astronaut-theme

```bash
sudo pacman -S sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
sudo cp -r ./Fonts/* /usr/share/fonts/
```

```bash
sudo cp -r ~/Descargas/dotfiles/sddm /usr/share/sddm/themes/sddm-astronaut
```

```bash
sudo rm /etc/sddm.conf
sudo cp sddm.conf /etc/sddm.conf
```

```bash
echo "[General]
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf
```
