#!/bin/sh

# Gen rec packs
sudo pacman -S ufw rsync reflector wayland xorg-xwayland gnome transmission-gtk tlp pipewire lib32-pipewire pipewire-docs wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack man-db

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

# Gnome
sudo systemctl enable gdm.service 

# Power managment
sudo systemctl enable tlp.service

# Another apps
sudo pacman -S firefox telegram-desktop vlc spotify-launcher qalculate-gtk

