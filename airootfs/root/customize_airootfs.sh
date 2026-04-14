#!/usr/bin/env bash
set -e -u

# Live kullanıcısı oluştur
useradd -m -G wheel,audio,video,storage,optical,network -s /bin/bash kiruhi
echo "kiruhi:kiruhi" | chpasswd   # şifre: liveuser (veya şifresiz)

# Şifresiz sudo
echo "kiruhi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# SDDM'i enable et
systemctl enable sddm.service

# NetworkManager enable
systemctl enable NetworkManager.service

# Wayland için env (opsiyonel ama önerilen)
mkdir -p /etc/environment.d
cat > /etc/environment.d/10-wayland.conf << EOF
QT_QPA_PLATFORM=wayland
MOZ_ENABLE_WAYLAND=1
EOF
