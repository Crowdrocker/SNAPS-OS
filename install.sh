#!/bin/bash

echo "installing pre-requisites"

sudo pacman -Syu ghostty shelly firefox jp2a adw-gtk-theme yazi cava btop tela-circle-icon-theme-black dms-shell yay git wl-clipboard nautilus zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions zsh-doc stow brightnessctl pipewire-pulse pipewire matugen adw-gtk-theme hyprshot grim satty code shelly zoxide zsh zsh-theme-powerlevel10k eza ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-terminus-nerd ttf-firacode-nerd ttf-ubuntu-nerd python-gobject python-cairo wtype

yay -S mangowm-git dsearch-bin qt6ct-kde adwsteamgtk dcal

WORKINGDIR=$(pwd)

if [ $WORKINGDIR != "/home/$(whoami)/SNAPS-OS" ]; then
    ln -sf $WORKINGDIR /home/$(whoami)
fi

mv /home/$(whoami)/.config/mango /home/$(whoami)/.config/mango-old-$RANDOM
cp -r /home/$(whoami)/SNAPS-OS/mango /home/$(whoami)/.config
mv /home/$(whoami)/.config/snapsos /home/$(whoami)/.config/snapsos-old-$RANDOM
cp -r /home/$(whoami)/SNAPS-OS/snapsos /home/$(whoami)/.config
mv /home/$(whoami)/.config/ghostty /home/$(whoami)/.config/ghostty-old-$RANDOM
cp -r /home/$(whoami)/SNAPS-OS/ghostty /home/$(whoami)/.config
mv /home/$(whoami)/.config/DankMaterialShell /home/$(whoami)/.config/DankMaterialShell-old-$RANDOM
cp -r /home/$(whoami)/SNAPS-OS/DankMaterialShell /home/$(whoami)/.config
mv /home/$(whoami)/.config/matugen /home/$(whoami)/.config/matugen-old-$RANDOM
cp -r /home/$(whoami)/SNAPS-OS/matugen /home/$(whoami)/.config


echo "projects" > ~/.config/projectdir.state
mkdir -p ~/projects
echo "none:default.jsonc" > ~/.config/fetch.state

mv /home/$(whoami)/.zshrc /home/$(whoami)/.zshrc-old-$RANDOM
cp /home/$(whoami)/.config/snapsos/zshrc /home/$(whoami)/.zshrc
mv /home/$(whoami)/.p10k.zsh /home/$(whoami)/.p10k.zsh-old-$RANDOM
cp /home/$(whoami)/.config/snapsos/p10k.zsh /home/$(whoami)/.p10k.zsh

chmod -R a+x ~/.config/snapsos
sudo ln -sf /home/$(whoami)/.config/snapsos/fastfetch/fetch-conf.sh /usr/bin/fetchconf
sudo ln -sf /home/$(whoami)/.config/snapsos/fastfetch/fetch.sh /usr/bin/fetch

sudo ln -sf /home/$(whoami)/.config/snapsos/config-overview/menu.sh /usr/bin/mangoconf-viewer
sudo ln -sf /home/$(whoami)/.config/snapsos//mango-config.sh /usr/bin/mangoconf-editor

sudo ln -sf /home/$(whoami)/.config/snapsos/help/cmd-help.sh /usr/bin/cmdhelp

sudo ln -sf /home/$(whoami)/.config/snapsos/tuis/layout-switch.sh /usr/bin/mango-layout

sudo ln -sf /home/$(whoami)/.config/snapsos/tuis/projectselect.sh /usr/bin/projects

sudo ln -sf /home/$(whoami)/.config/snapsos/wallpapers/setwallpapergroup.sh /usr/bin/wallpaper-select

sudo ln -sf /home/$(whoami)/.config/snapsos/glyphs/glyphs-cli.py /usr/bin/glyphs
sudo ln -sf /home/$(whoami)/.config/snapsos/vox/vox.sh /usr/bin/vox

mkdir -p /home/$(whoami)/.local/share/applications
cp "$WORKINGDIR/snapsos/vox/vox-config.desktop" /home/$(whoami)/.local/share/applications/vox-config.desktop

echo "SNAPS-OS comes with the following optional extra scripts:"
echo " - unipkg: universal package management TUI scripting"
echo " - dotfile-git-sync: a script to make migrating your dotfiles to a github directory easy"
echo ""
read -p "Do you want to install the additional scripts? [Y/n] " -n 1 -r
echo  # Move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    git clone https://github.com/Crowdrocker/unipkg ~/projects/unipkg
    git clone https://github.com/Crowdrocker/dotfile-git-sync ~/projects/dotfile-git-sync
    echo "installing unipkg"
    bash -c "~/projects/unipkg/install.sh"
    mkdir -p ~/.local/share/dotfile-git-sync
    cp ~/projects/dotfile-git-sync/dotfile-git-sync ~/.local/share/dotfile-git-sync
    sudo ln -sf /home/$(whoami)/.local/share/dotfile-git-sync/dotfile-git-sync /usr/bin
    chmod a+x ~/.local/share/dotfile-git-sync/dotfile-git-sync

else
    echo "optional scripts skipped, you can always install them manually later."
fi

echo "SNAPS-OS can optionally download Distro Wallpapers for you"
echo "this is done from the following github: https://github.com/LinuxKits/Distro-wallpapers"
echo "the repository will be cloned into ~/projects/Distro-wallpapers"
echo ""
read -p "Do you want to add Distro Wallpapers? [Y/n] " -n 1 -r
echo  # Move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    git clone https://github.com/LinuxKits/Distro-wallpapers ~/projects/Distro-wallpapers


else
    echo "optional scripts skipped, you can always install them manually later."
fi


echo "installation complete! you should now be able to reboot and switch to \"mango\" in your log-in manager"
