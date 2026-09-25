#!/usr/bin/env bash
set -e

useradd -m -s /bin/bash -G wheel,audio,video,network,storage,optical akira 2>/dev/null || true
echo "akira:akira" | chpasswd
echo "root:root" | chpasswd
echo "akira ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/akira
chmod 0440 /etc/sudoers.d/akira

mkdir -p /etc/systemd/system/getty@tty1.service.d
cat > /etc/systemd/system/getty@tty1.service.d/autologin.conf << 'AUTOEOF'
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin akira --noclear %I $TERM
Type=idle
AUTOEOF

cat > /home/akira/.bash_profile << 'PROFEOF'
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx
fi
PROFEOF
chown akira:akira /home/akira/.bash_profile

mkdir -p /home/akira/.config/openbox
cat > /home/akira/.config/openbox/autostart << 'OBEOF'
pcmanfm --desktop &
xsetroot -solid "#1a1a2e" &
OBEOF
chown -R akira:akira /home/akira/.config

cat > /home/akira/.xinitrc << 'XIEOF'
#!/bin/sh
exec openbox-session
XIEOF
chmod +x /home/akira/.xinitrc
chown akira:akira /home/akira/.xinitrc

systemctl enable NetworkManager 2>/dev/null || true

mkdir -p /usr/local/bin
wget -q -O /usr/local/bin/autoserver \
  https://github.com/tinybinary-idk/autoserver/releases/download/v1.0.0/autoserver-linux-amd64 2>/dev/null || true
chmod +x /usr/local/bin/autoserver 2>/dev/null || true

cat > /etc/motd << 'MOTDEOF'

  ╔══════════════════════════════════════════╗
  ║     so so not so tinyOS                  ║
  ║     Login: akira    Password: akira      ║
  ║     Root:  root     Password: root       ║
  ╚══════════════════════════════════════════╝

MOTDEOF

pacman -Scc --noconfirm 2>/dev/null || true
