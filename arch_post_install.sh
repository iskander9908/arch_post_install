#!/bin/bash

#Wayland and Xwayland
sudo pacman -S wayland xorg-xwayland

#Drivers
sudo pacman -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau mesa-utils

#Window manager and sompe apps
sudo pacman -S sway swaylock swayidle swaybg otf-font-awesome waybar foot deluge polkit wofi grim slurp
mkdir -p ~/.config/sway
cp ~/arch_post_install/sway/config ~/.config/sway
cp -r ~/arch_post_install/waybar ~/.config/

#Display manager
sudo pacman -S sddm
sudo systemctl enable sddm.service

#Security
sudo pacman -S ufw rsync
sudo systemctl enable ufw.service
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw allow Deluge
sudo ufw limit ssh
sudo ufw enable

#Mirrors
sudo pacman -S reflector
sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

#Home dirs
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update

#Power managment
sudo pacman -S tlp
sudo systemctl enable tlp.service

#Sound system
sudo pacman -S pipewire lib32-pipewire pipewire-jack lib32-pipewire-jack pipewire-docs wireplumber qpwgraph

#Another apps
sudo pacman -S firefox telegram-desktop spotify-launcher thunar xarchiver catfish featherpad libreoffice-still atril qalculate-gtk

#Reboot
systemctl reboot

###Don't forget to create swap file and install aur helper
