# SNAPS-OS

mangoWM dotfiles with DMS integration and a collection of utility scripts, tools, and configurations.

## Features

- pacman and AUR TUIs (alternative package managers)
- tips system (auto-shown on terminal start)
- update script (manual update helper)
- mango configuration manager TUI (editor + viewer)
- project manager TUI
- screenshot scripts (fullscreen + region + editor)
- wallpaper group switcher with DMS integration
- bar preset switcher
- Glyphs — pen/stylus gesture system
- Vox — voice command system
- Wayshell — event manager daemon
- Monocle — per-monitor window switcher
- Matugen Material You auto-theming (btop, cava, yazi, etc.)

## Auto-install

```
cd ~
git clone https://github.com/Crowdrocker/SNAPS-OS.git
cd SNAPS-OS
chmod a+x install.sh
./install.sh
```

Update by running `git pull` then `./update.sh`. Note that updating will overwrite
config changes — back up customizations or reference git diffs to merge changes.

## Manual install

```
cd ~
git clone https://github.com/Crowdrocker/SNAPS-OS.git
cd SNAPS-OS
cp -r mango ~/.config
cp -r snapsos ~/.config
cp -r ghostty ~/.config
cp -r DankMaterialShell ~/.config
cp -r matugen ~/.config
sudo chmod -R a+x ~/.config/snapsos
cp ~/.config/snapsos/zshrc ~/.zshrc
cp ~/.config/snapsos/p10k.zsh ~/.p10k.zsh
mkdir -p ~/projects
echo "projects" > ~/.config/projectdir.state
echo "none:default.jsonc" > ~/.config/fetch.state
```

### Symlinks (optional, for terminal access)

```
sudo ln -sf ~/.config/snapsos/fastfetch/fetch.sh /usr/bin/fetch
sudo ln -sf ~/.config/snapsos/fastfetch/fetch-conf.sh /usr/bin/fetchconf
sudo ln -sf ~/.config/snapsos/config-overview/menu.sh /usr/bin/mangoconf-viewer
sudo ln -sf ~/.config/snapsos/mango-config.sh /usr/bin/mangoconf-editor
sudo ln -sf ~/.config/snapsos/help/cmd-help.sh /usr/bin/cmdhelp
sudo ln -sf ~/.config/snapsos/tuis/layout-switch.sh /usr/bin/mango-layout
sudo ln -sf ~/.config/snapsos/tuis/project-select.sh /usr/bin/projects
sudo ln -sf ~/.config/snapsos/wallpapers/setwallpapergroup.sh /usr/bin/wallpaper-select
sudo ln -sf ~/.config/snapsos/glyphs/glyphs-cli.py /usr/bin/glyphs
sudo ln -sf ~/.config/snapsos/vox/vox.sh /usr/bin/vox
```

### Optional extras

The install script will ask about these:

- **unipkg** <https://github.com/Crowdrocker/unipkg> — universal package management TUI
- **dotfile-git-sync** <https://github.com/Crowdrocker/dotfile-git-sync> — migrate dotfiles to GitHub
- **Distro Wallpapers** <https://github.com/LinuxKits/Distro-wallpapers> — wallpaper collection

## Post-install

- Tweak display config via DMS settings or by editing `monitors.conf`.
- View keybinds: press `SUPER+K` (auto-generated from binds.conf).
- Application auto-theming docs: <https://danklinux.com/docs/dankmaterialshell/application-themes>
- mangoWM docs: <https://mangowm.github.io/docs>

## Package requirements

### pacman

```
ghostty shelly firefox jp2a adw-gtk-theme yazi cava btop
tela-circle-icon-theme-black dms-shell yay git wl-clipboard
nautilus zsh-history-substring-search zsh-syntax-highlighting
zsh-autosuggestions zsh-doc stow brightnessctl pipewire-pulse
pipewire matugen hyprshot grim satty code zoxide zsh
zsh-theme-powerlevel10k eza ttf-nerd-fonts-symbols-common
ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols
ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-terminus-nerd
ttf-firacode-nerd ttf-ubuntu-nerd python-gobject python-cairo wtype
```

### AUR (via yay)

```
mangowm-git dsearch-bin qt6ct-kde adwsteamgtk dcal
```

## Mango config editor

Press `SUPER+M` or run `mangoconf`. Select a config file to open in micro (change
the `app=` line in `mango-config.sh` to use a different editor).

## Mango config viewer

Press `SUPER+ALT+M` or run `mangoconf-viewer`. Browse config files line by line
with details. Press `ALT+B` to open documentation for a setting in Firefox.

## Documentation quicklinks

Press `SUPER+SHIFT+M` or run `documentation` in the terminal. Opens a menu with
links to mangoWM docs, DMS docs, Ghostty docs, Arch Wiki, and built-in reference
sheets (DMS IPC, mangoWM config options, dispatchers, IPC commands).

## Ghostty config

SNAPS-OS ships a Ghostty config that syncs theme with DMS, sets Zsh as default
shell, and configures multi-window keybinds:
- `Ctrl+Arrow` — split pane
- `Ctrl+R` — reload config
- Mouse drag — resize panes
- Auto-focus on hover

## Zsh config

- `eza` replaces `ls` (colored icons, permissions, file info)
- `zoxide` replaces `cd` (fuzzy jump to visited directories)
- `fzf` integration: `**<TAB>` for fuzzy completion
- `microfind`: fzf file search, opens selected in micro
- Suffix aliases: enter a filename to open in default app
- Powerlevel10k prompt

## Installer TUIs

SNAPS-OS includes `pacgui` (pacman browser) and `aurgui` (AUR browser) with
multi-select support and package details. Launch via terminal aliases or bind
them in `binds.conf` (uncomment lines, defaults favor shelly + unipkg).

## Tips

Random tips shown on first terminal launch, via `tipme`, or `SUPER+0` (notification popup).
`alltips` opens all tips in an fzf browser.

## Project manager

Press `SUPER+SHIFT+TAB` or run `git-projects`. Browses git repos in your
projects directory (default `~/projects`). Shows file listing and README preview.
Select a repo to open in code-oss/VSCode.

Change projects directory:
```
echo "MyProjects/Subdir" > ~/.config/projectdir.state
```
(Directory must be under home; do not use ~ or home directly.)

## Wallpapers

Press `SUPER+W` to open wallpaper group switcher. Groups are folders in
`~/.config/snapsos/wallpapers/`. Images cycle alphabetically. Single-image groups
do not cycle. `ALT+W` and `ALT+SHIFT+W` for next/previous.

Call a group directly:
```
~/.config/snapsos/wallpapers/setwallpapergroup.sh default
```

## Requesting features

Open an issue at <https://github.com/Crowdrocker/SNAPS-OS/issues>
