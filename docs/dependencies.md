# Dependencies

> Per-component dependency inventory. Packages listed are Arch Linux names
> (from `install.sh`); cross-distro equivalents for Vox are noted inline.

---

## 1. mangoWM (Compositor)

| Type     | Name             | Source | Notes                    |
| -------- | ---------------- | ------ | ------------------------ |
| AUR      | `mangowm-git`    | yay    | The compositor itself    |
| Runtime  | `mmsg`           | —      | IPC tool, ships with mangoWM |
| Runtime  | `jq`             | pacman | JSON parsing by many components |

---

## 2. DankMaterialShell (DMS)

| Type     | Name             | Source | Notes                    |
| -------- | ---------------- | ------ | ------------------------ |
| System   | `dms-shell`      | pacman | Desktop shell / panel    |
| Runtime  | `dms`            | —      | DMS IPC tool             |
| Optional | `flatpak`        | —      | Required only by the FlatpakUpdates plugin |

---

## 3. Ghostty (Terminal Config)

| Type     | Name             | Source | Notes                    |
| -------- | ---------------- | ------ | ------------------------ |
| System   | `ghostty`        | pacman | Terminal emulator        |

---

## 4. Glyphs (Pen Gesture System)

| Type     | Name                 | Source | Notes                        |
| -------- | -------------------- | ------ | ---------------------------- |
| System   | `python-gobject`     | pacman | Python GTK 3 bindings        |
| System   | `python-cairo`       | pacman | Python Cairo bindings        |
| System   | `gtk3`               | pacman | Implicit dep of python-gobject |
| System   | `wtype`              | pacman | Wayland text input            |
| Optional | `tesseract`              | —      | OCR for text-bracket mode     |
| Python   | *(none beyond stdlib)*  | —      | No Python dependencies        |

---

## 5. Vox (Voice Command System)

### System Packages

| Distro    | Packages                                                      |
| --------- | ------------------------------------------------------------- |
| **Arch**  | `python-gobject`, `gst-plugins-base`, `gst-plugins-good`, `gtk-layer-shell`, `pipewire`, `pipewire-pulse`, `ydotool`, `whisper-cpp-vulkan` (or `gst-plugin-whisper`) |
| **Debian**| `python3-gi`, `python3-gi-cairo`, `gir1.2-gstreamer-1.0`, `gstreamer1.0-plugins-base`, `gstreamer1.0-plugins-good`, `pipewire`, `pipewire-pulse`, `ydotool` |
| **Fedora**| `python3-gobject`, `gstreamer1-plugins-base`, `gstreamer1-plugins-good`, `pipewire`, `pipewire-pulse`, `ydotool` |

### Python

| Name   | From         | Notes                      |
| ------ | ------------ | -------------------------- |
| *(none)* | —          | whisper-server is an external binary, not a pip package |
| Requires Python ≥ 3.10 |     |                            |

### External Commands

| Command           | Purpose                            |
| ----------------- | ---------------------------------- |
| `whisper-server`  | Speech-to-text inference daemon    |
| `ydotool`         | Simulate typing on Wayland         |
| `pw-cli` / `pactl`| Audio server detection             |
| `curl` / `wget`   | Download whisper model             |
| `pkill` / `pgrep` | Manage whisper-server lifecycle    |

### Model

- **File:** `ggml-medium.en.bin` (~1.5 GB)
- **Source:** Hugging Face (`ggerganov/whisper.cpp`)
- **Location:** `~/.config/snapsos/vox/models/`
- Auto-downloaded on first `vox daemon` if absent.

### Desktop File

- `vox-config.desktop` → `~/.local/share/applications/`
- Launches `vox config` (GTK config UI).

---

## 6. Wayshell (Event Manager)

| Type     | Command / Package  | Source | Notes                    |
| -------- | ------------------ | ------ | ------------------------ |
| Runtime  | `mmsg`             | —      | IPC with mangoWM          |
| Runtime  | `jq`               | pacman | JSON parsing              |
| Runtime  | `wpctl`            | —      | From `pipewire-pulse`     |
| Runtime  | `brightnessctl`    | pacman | Backlight control         |
| Runtime  | `grim`             | pacman | Screenshot (ss-capture)   |
| Runtime  | `slurp`            | —      | Area selection (ss-capture) |
| Runtime  | `wl-copy`          | pacman | Clipboard (ss-capture)    |
| Runtime  | `satty`            | pacman | Screenshot editor         |
| Runtime  | `notify-send`      | —      | From `libnotify`          |
| Runtime  | `zenity`           | —      | Settings dialogs          |
| Runtime  | `pkill` / `pgrep` / `killall` | — | Process management   |
| Runtime  | `nvidia-smi`       | —      | GPU stats (optional, focused-daemon) |
| Runtime  | `awk`, `sed`, `grep`, `cut`, `tr`, `cat`, `sort`, `wc`, `paste`, `head`, `tail`, `diff`, `bc`, `nproc`, `getconf`, `readlink`, `ps`, `date` | — | Standard GNU/POSIX tools, expected on any Linux system |

---

## 7. Monocle (Window Switcher)

| Type     | Name    | Source | Notes                         |
| -------- | ------- | ------ | ----------------------------- |
| Runtime  | `waybar`| pacman | Renders the monocle bar       |
| Runtime  | `mmsg`  | —      | IPC with mangoWM               |
| Runtime  | `jq`    | pacman | JSON parsing                   |

---

## 8. Fastfetch (System Info)

| Type     | Name        | Source | Notes                         |
| -------- | ----------- | ------ | ----------------------------- |
| System   | `fastfetch` | pacman | System info display tool      |
| System   | `jp2a`      | pacman | ASCII art conversion (update-files.sh) |
| Runtime  | `fzf`       | pacman | Logo/config selector (fetch-conf.sh) |
| Runtime  | `bat`       | pacman | Preview config styles         |

---

## 9. Matugen (Color Engine)

| Type     | Name      | Source | Notes                    |
| -------- | --------- | ------ | ------------------------ |
| System   | `matugen` | pacman | Material You color theme generator |
| *Runtime config only — no additional system or Python dependencies.* |

---

## 10. TUIs (Terminal User Interfaces)

| Script              | External Commands                                       |
| ------------------- | ------------------------------------------------------- |
| `project-select.sh` | `find`, `realpath`, `xargs`, `readlink`, `fzf`, `eza`, `cat`, `code-oss` (optional), `mmsg` |
| `pkg-install.sh`    | `pacman`, `fzf`, `xargs`, `sudo`, `tr`                  |
| `aur-install.sh`    | `yay`, `fzf`, `sudo`, `updatedb`, `sed`, `tr`, `xargs` |
| `layout-switch.sh`  | `fzf`, `cut`, `grep`, `cat`                             |
| `bar-presets.sh`    | `fzf`, `dms`, `notify-send`                             |
| `documentation.sh`  | `fzf`, `cut`, `grep`, `cat`                             |

### Shared Runtime Dependencies

| Type     | Name       | Source | Notes                            |
| -------- | ---------- | ------ | -------------------------------- |
| System   | `fzf`      | pacman | Fuzzy finder (all TUIs)          |
| Runtime  | `bat`      | pacman | Syntax-highlighted previews      |
| Runtime  | `eza`      | pacman | Modern `ls` (project-select)     |
| Runtime  | `micro`    | —      | Terminal editor (mango-config.sh)|
| Runtime  | `yay`      | AUR    | AUR helper (aur-install)         |

---

## 11. Config Overview (mangoconf-viewer / mangoconf-editor)

| Type     | Name       | Source | Notes                    |
| -------- | ---------- | ------ | ------------------------ |
| Runtime  | `fzf`      | pacman | Key/option selector      |
| Runtime  | `bat`      | pacman | Preview rendering        |
| Runtime  | `micro`    | —      | Editor (mangoconf-editor)|
| Runtime  | `firefox`  | pacman | Browser mode             |
| Runtime  | `cut`, `sed`, `grep` | — | Config key parsing    |

---

## 12. Screenshots

| Type     | Command      | Source | Notes                    |
| -------- | ------------ | ------ | ------------------------ |
| System   | `grim`       | pacman | Fullscreen capture       |
| System   | `hyprshot`   | pacman | Region capture           |
| System   | `satty`      | pacman | Screenshot editor        |
| Runtime  | `wl-copy`    | pacman | Clipboard integration    |
| Runtime  | `notify-send`| —      | From `libnotify`         |
| Runtime  | `slurp`      | —      | Area selection (wayshell capture) |
| Runtime  | `zenity`     | —      | Settings menu            |

---

## 13. Wallpapers

| Type     | Name          | Source | Notes                    |
| -------- | ------------- | ------ | ------------------------ |
| Runtime  | `dms`         | —      | DMS IPC for wallpaper changes |
| Runtime  | `mmsg`        | —      | mangoWM IPC               |
| Runtime  | `fzf`         | pacman | Group selector            |
| Runtime  | `notify-send` | —      | From `libnotify`          |

---

## 14. Help & Tips

| Type     | Command       | Source | Notes                    |
| -------- | ------------- | ------ | ------------------------ |
| Runtime  | `fzf`         | pacman | Topic / command selector |
| Runtime  | `bat`         | pacman | Markdown rendering       |
| Runtime  | `tldr`        | —      | Simplified man pages (cmd-help) |
| Runtime  | `man`         | —      | Manual pages (cmd-help)  |
| Optional | `cowsay`      | —      | Fun display (tips.sh)    |
| Optional | `lolcat`      | —      | Rainbow color (tips.sh)  |

---

## 15. Zsh Configuration

| Type     | Package                          | Source | Notes                    |
| -------- | -------------------------------- | ------ | ------------------------ |
| System   | `zsh`                            | pacman | Shell                    |
| System   | `zsh-theme-powerlevel10k`        | pacman | Prompt theme             |
| System   | `zsh-history-substring-search`   | pacman | History search plugin    |
| System   | `zsh-syntax-highlighting`        | pacman | Syntax highlighting      |
| System   | `zsh-autosuggestions`            | pacman | Auto-suggestions plugin  |
| System   | `zsh-doc`                        | pacman | Zsh documentation        |
| System   | `zoxide`                         | pacman | Smart directory jumping  |

---

## 16. System-wide (Installed by `install.sh`)

### pacman

```
ghostty shelly firefox jp2a adw-gtk-theme yazi cava btop
tela-circle-icon-theme-black dms-shell yay git wl-clipboard
nautilus zsh-history-substring-search zsh-syntax-highlighting
zsh-autosuggestions zsh-doc stow brightnessctl pipewire-pulse
pipewire matugen adw-gtk-theme hyprshot grim satty code shelly
zoxide zsh zsh-theme-powerlevel10k eza
ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono
ttf-nerd-fonts-symbols ttf-cascadia-code-nerd
ttf-cascadia-mono-nerd ttf-terminus-nerd ttf-firacode-nerd
ttf-ubuntu-nerd python-gobject python-cairo wtype
```

### AUR (via yay)

```
mangowm-git dsearch-bin qt6ct-kde adwsteamgtk dcal
```

---

## 17. Optional Extras

| Component            | Source                                   | Notes                              |
| -------------------- | ---------------------------------------- | ---------------------------------- |
| `unipkg`             | `https://github.com/Crowdrocker/unipkg`      | Universal package management TUI   |
| `dotfile-git-sync`   | `https://github.com/Crowdrocker/dotfile-git-sync` | Dotfile migration to GitHub   |
| Distro Wallpapers    | `https://github.com/LinuxKits/Distro-wallpapers` | Wallpaper collection        |

---

## 18. Symlinks Created During Install

| Symlink Target                                     | Symlink Path               |
| -------------------------------------------------- | -------------------------- |
| `~/.config/snapsos/fastfetch/fetch.sh`               | `/usr/bin/fetch`           |
| `~/.config/snapsos/fastfetch/fetch-conf.sh`          | `/usr/bin/fetchconf`       |
| `~/.config/snapsos/config-overview/menu.sh`          | `/usr/bin/mangoconf-viewer`|
| `~/.config/snapsos/mango-config.sh`                  | `/usr/bin/mangoconf-editor`|
| `~/.config/snapsos/help/cmd-help.sh`                 | `/usr/bin/cmdhelp`         |
| `~/.config/snapsos/tuis/layout-switch.sh`            | `/usr/bin/mango-layout`    |
| `~/.config/snapsos/tuis/project-select.sh`           | `/usr/bin/projects`        |
| `~/.config/snapsos/wallpapers/setwallpapergroup.sh`  | `/usr/bin/wallpaper-select`|
| `~/.config/snapsos/glyphs/glyphs-cli.py`             | `/usr/bin/glyphs`          |
| `~/.config/snapsos/vox/vox.sh`                       | `/usr/bin/vox`             |

> **Note:** `install.sh` line 47 symlinks `projectselect.sh` (no hyphen), but the
> actual file is `project-select.sh` (with hyphen). This is a known bug in the
> install script — the symlink target is wrong.

---

## 19. Services

SDG-OS does **not** install any systemd units. Services expected at runtime:

| Service             | Started by                  | Notes                              |
| ------------------- | --------------------------- | ---------------------------------- |
| `pipewire`          | Display manager / user      | Audio graph                         |
| `pipewire-pulse`    | Display manager / user      | PulseAudio compatibility            |
| mangoWM (compositor)| Display manager (`mango.desktop`) | Selected at login screen        |
| `whisper-server`    | `vox daemon`                | Spawned on-demand, not a persistent service |
