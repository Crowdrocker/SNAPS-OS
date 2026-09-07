# Installation

## Prerequisites

- Arch Linux (or derivative)
- An AUR helper — the install script uses `yay`

## Full Install

Clone the repository into your home directory, then run the install script:

```bash
cd ~
git clone https://github.com/SDG-Den/SNAPS-OS.git
chmod a+x SNAPS-OS/install.sh
./SNAPS-OS/install.sh
```

The install script will:

1. **Install system packages** via `pacman -Syu`:
   ghostty, shelly, firefox, dms-shell, matugen, yazi, cava, btop, zsh, eza, git, wl-clipboard, grim, hyprshot, satty, jp2a, stow, brightnessctl, pipewire, python-gobject, python-cairo, wtype, adw-gtk-theme, tela-circle-icon-theme-black, nautilus, code, zoxide, zsh-theme-powerlevel10k, several Nerd Fonts, and Zsh plugins

2. **Install AUR packages** via `yay -S`: mangowm-git, dsearch-bin, qt6ct-kde, adwsteamgtk, dcal

3. **Symlink the repo** to `~/SNAPS-OS` if cloned elsewhere

4. **Back up existing configs** to `*-old-$RANDOM`, then **copy** these directories to `~/.config/`:
   - `mango/` — MangoWM configs
   - `snapsos/` — SNAPS-OS scripts and tools
   - `ghostty/` — Ghostty terminal config
   - `DankMaterialShell/` — DMS configs
   - `matugen/` — Matugen templates

5. **Initialize config state files**: `~/.config/projectdir.state` (content: `projects`) and `~/.config/fetch.state` (content: `none:default.jsonc`)

6. **Install Zsh config**: copies `zshrc` → `~/.zshrc` and `p10k.zsh` → `~/.p10k.zsh`

7. **Make all scripts executable** and **symlink** them to `/usr/bin/` for global access

8. **Copy Vox desktop entry** to `~/.local/share/applications/`

9. **Prompt for optional extras** (two separate prompts):
   - **First prompt**: [unipkg](https://github.com/Crowdrockern/unipkg) + [dotfile-git-sync](https://github.com/Crowdrocker/dotfile-git-sync) together
   - **Second prompt**: [Distro Wallpapers](https://github.com/LinuxKits/Distro-wallpapers)

## Post-Install

1. **Set your project directory** (used by the project browser TUI):

   ```bash
   echo "Documents/Projects" > ~/.config/projectdir.state
   ```

   Defaults to `~/projects`.

2. **Configure monitors**: edit `~/.config/mango/monitors.conf` or use DMS display settings

3. **Set up application auto-theming**: see [Matugen config](../configuration/matugen.md)

4. **Reboot** and select `mango` in your display manager

## Manual Install

If you prefer to copy files manually:

```bash
git clone https://github.com/Crowdrocker/SNAPS-OS.git

cp -r SNAPS-OS/mango ~/.config
cp -r SNAPS-OS/snapsos ~/.config
cp -r SNAPS-OS/ghostty ~/.config
cp -r SNAPS-OS/DankMaterialShell ~/.config
cp -r SNAPS-OS/matugen ~/.config

chmod -R a+x ~/.config/snapsos

cp SNAPS-OS/snapsos/zshrc ~/.zshrc
cp SNAPS-OS/snapsos/p10k.zsh ~/.p10k.zsh

echo "projects" > ~/.config/projectdir.state
```

You will need to manually symlink scripts to `/usr/bin/` if desired (see `install.sh` for the full list).
