# Hyprdots — Hyprland dark mode config

My personal Hyprland configuration for a Windows 10-like experience on Arch Linux.

## Structure

```
~/.config/hyprdots/
├── gtk-3.0/settings.ini     # GTK3 dark mode
├── gtk-4.0/settings.ini     # GTK4 dark mode
├── hypr/hyprland.lua        # Main Hyprland config
├── hypr/hyprlock.conf       # Lock screen
├── hyprpaper/hyprpaper.conf # Wallpaper
├── swaync/config.json       # Notification center
├── mimeapps.list            # Default apps (browser, terminal via xdg-open)
├── swaync/style.css         # Notification center style
├── waybar/config.jsonc      # Status bar
└── waybar/style.css         # Status bar style
```

## Setup symlinks

Run from this directory:

```bash
ln -sf $PWD/hypr/hyprland.lua    ~/.config/hypr/hyprland.lua
ln -sf $PWD/hypr/hyprlock.conf   ~/.config/hypr/hyprlock.conf
ln -sf $PWD/hyprpaper/hyprpaper.conf ~/.config/hyprpaper/hyprpaper.conf
ln -sf $PWD/waybar/config.jsonc  ~/.config/waybar/config.jsonc
ln -sf $PWD/waybar/style.css     ~/.config/waybar/style.css
ln -sf $PWD/mimeapps.list        ~/.config/mimeapps.list
ln -sf $PWD/swaync/config.json   ~/.config/swaync/config.json
ln -sf $PWD/swaync/style.css     ~/.config/swaync/style.css
ln -sf $PWD/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
ln -sf $PWD/gtk-4.0/settings.ini ~/.config/gtk-4.0/settings.ini
```

Or one-liner:

```bash
for f in hypr/hyprland.lua hypr/hyprlock.conf hyprpaper/hyprpaper.conf \
         mimeapps.list \
         waybar/config.jsonc waybar/style.css \
         swaync/config.json swaync/style.css \
         gtk-3.0/settings.ini gtk-4.0/settings.ini; do
  mkdir -p ~/.config/$(dirname $f)
  ln -sf $PWD/$f ~/.config/$f
done
```
