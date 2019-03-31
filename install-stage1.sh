#!/usr/bin/env bash

set -e

printf %s\\n "updating system and installing prerequisite software..."
sudo pacman --noconfirm --needed -Syu base-devel curl git stow

printf %s\\n "installing yay..."
TMP="$(mktemp -d)"
pushd "$TMP"
curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay-bin" -o PKGBUILD
makepkg -si --noconfirm --needed
popd

sudo sed -i '/Color/s/^#//g' /etc/pacman.conf
yay --sudoloop --save

printf %s\\n "installing zsh as login shell..."
yay --noconfirm --needed -S zsh
printf %s\\n "you'll be prompted for your password to chsh."
sudo chsh -s "$(command -v zsh)" "$(whoami)"

printf %s\\n "installing core graphical software..."
yay --noconfirm --needed -S \
    bspwm sxhkd compton \
    polybar rofi rxvt-unicode ttf-font-awesome-4 ttf-hack \
    dunst libnotify \
    python-pywal feh neofetch \
    ranger highlight w3m \
    light redshift-minimal maim \
    udisks2 udiskie \
    xorg-xinit xorg-server xorg-xdpyinfo xclip

printf %s\\n "installing dotfiles..."
git clone --recursive https://github.com/JoshuaRLi/dotfiles "${HOME}/dotfiles"
cd "${HOME}/dotfiles"
# prevent conflict with GNU stow - more conflicting files may exist if user is not running a fresh Arch install
mv "${HOME}/.bashrc"{,.bak}
bash ./link.sh og
