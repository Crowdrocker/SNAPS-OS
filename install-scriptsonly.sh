#!/bin/bash

WORKINGDIR=$(pwd)

cp -r $WORKINGDIR/snapsos ~/.config

sudo ln -sf /home/$(whoami)/.config/snapsos/fastfetch/fetch-conf.sh /usr/bin/fetchconf
sudo ln -sf /home/$(whoami)/.config/snapsos/fastfetch/fetch.sh /usr/bin/fetch

sudo ln -sf /home/$(whoami)/.config/snapsos/config-overview/menu.sh /usr/bin/mangoconf-viewer

sudo ln -sf /home/$(whoami)/.config/snapsos/help/cmd-help.sh /usr/bin/cmdhelp

sudo ln -sf /home/$(whoami)/.config/snapsos/tuis/layout-switch.sh /usr/bin/mango-layout

sudo ln -sf /home/$(whoami)/.config/snapsos/tuis/projectselect.sh /usr/bin/projects
echo "projects" > ~/.config/projectdir.state

sudo ln -sf /home/$(whoami)/.config/snapsos/wallpapers/setwallpapergroup.sh /usr/bin/wallpaper-select

sudo ln -sf /home/$(whoami)/.config/snapsos/glyphs/glyphs-cli.py /usr/bin/glyphs

sudo ln -sf /home/$(whoami)/.config/snapsos//mango-config.sh /usr/bin/mangoconf-editor
sudo ln -sf /home/$(whoami)/.config/snapsos/vox/vox.sh /usr/bin/vox
