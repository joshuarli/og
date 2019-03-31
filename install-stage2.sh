#!/usr/bin/env bash

set -e

# TODO: check whether we are in X before running

printf %s\\n "installing physlock..."
yay --noconfirm --needed -S physlock
sudo tee /etc/systemd/system/physlock.service >/dev/null <<EOF
[Unit]
Description=Lock X session with physlock
Before=sleep.target

[Service]
Type=forking
ExecStart=$(command -v physlock) -dsp 'This computer is locked.'

[Install]
WantedBy=sleep.target
EOF
sudo systemctl enable /etc/systemd/system/physlock.service

printf %s\\n "processing wallpapers..."
yay --noconfirm --needed -S imgp
# TODO: autodetect monitor resolution
w=1920
h=1080
bash "${PWD}/wallcrunch" "${PWD}/Wallpapers" "$w" "$h"
ln -sf "${PWD}/Wallpapers-${w}x${h}" "$HOME"
