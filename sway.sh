#!/bin/sh

# Gen rec packs
sudo pacman -S ufw rsync reflector wayland xorg-xwayland sway swaylock swayidle swaybg udisks2 brightnessctl noto-fonts otf-font-awesome waybar thunar foot dunst man-db network-manager-applet nm-connection-editor transmission-gtk polkit wofi grim slurp xdg-user-dirs tlp pipewire lib32-pipewire pipewire-docs wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack pavucontrol

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

# Aur helper
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd ~/paru
makepkg -si

# USB controller firmware and some aur stuff
paru -S upd72020x-fw wob clipman batsignal

#
# Sway
#
cp -r ~/arch_post_install/sway ~/.config/

# Waybar
cp -r /etc/xdg/waybar ~/.config/
# Background
cp ~/arch_post_install/winter-landscape-from-drone-1920x1080_894877-mm-90.jpg ~/Pictures

#
# Notifications
#

#Dunst
cp -r ~/arch_post_install/dunst ~/.config/

#Batsignal
sudo systemctl daemon-reload
systemctl enable --now --user batsignal.service
mkdir -p ~/.config/systemd/user/batsignal.service.d
printf '[Service]\nExecStart=\nExecStart=batsignal -c 10 -w 30 -f 97' > ~/.config/systemd/user/batsignal.service.d/options.conf

# Play-sound notifications script
cp -r ~/arch_post_install/bin ~/.local/
chmod +x ~/.local/bin/warning.sh

# WOB
systemctl enable --now --user wob.socket

#Firefox
sudo echo "MOZ_ENABLE_WAYLAND=1" >> /etc/environment

# Foot
cp -r /etc/xdg/foot ~/.config/

# Another apps
sudo pacman -S catfish liferea firefox telegram-desktop vlc spotify-launcher imv atril file-roller libreoffice-still qalculate-gtk

### Also you may want to create swap file, change shell and configure usb mounter
