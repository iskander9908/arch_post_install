#!/bin/bash

# Gen rec packs
sudo pacman -S ufw rsync reflector wayland xorg-xwayland sway swaylock swayidle swaybg udisks2 brightnessctl noto-fonts otf-font-awesome waybar foot mako man-db network-manager-applet nm-connection-editor transmission-qt polkit wofi grim slurp xdg-user-dirs tlp pipewire lib32-pipewire pipewire-docs wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack pavucontrol

# Drivers
sudo pacman -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau mesa-utils

# Security
sudo systemctl enable ufw.service
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw allow Transmission
sudo ufw limit ssh
sudo ufw enable

# Mirrors
sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Home dirs
xdg-user-dirs-update

# Power managment
sudo systemctl enable tlp.service

# Sway
cp -r ~/arch_post_install/sway ~/.config/
cp -r /etc/xdg/waybar ~/.config/

# Another apps
sudo pacman -S firefox telegram-desktop vlc spotify-launcher thunar imv xarchiver catfish featherpad libreoffice-still atril qalculate-gtk

### Also you may want to create swap file, change shell, configure usb mounter and install aur helper
