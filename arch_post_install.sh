#!/bin/bash

#Gen rec packs
sudo pacman -S ufw rsync reflector wayland xorg-xwayland sway swaylock swayidle swaybg otf-font-awesome waybar foot dunst transmission polkit wofi grim slurp sddm xdg-user-dirs tlp pipewire lib32-pipewire pipewire-docs pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack

#Drivers
sudo pacman -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau mesa-utils

#Security
sudo systemctl enable ufw.service
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw allow Transmission
sudo ufw limit ssh
sudo ufw enable

#Display manager
sudo systemctl enable sddm.service

#Mirrors
sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

#Home dirs
xdg-user-dirs-update

#Power managment
sudo systemctl enable tlp.service

#Another apps
sudo pacman -S firefox telegram-desktop spotify-launcher thunar xarchiver catfish featherpad libreoffice-still atril qalculate-gtk

###Don't forget to create swap file and install aur helper
