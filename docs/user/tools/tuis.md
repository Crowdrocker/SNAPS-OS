# TUI Scripts

**Location**: `~/.config/snapsos/tuis/`

A collection of fzf-based terminal user interface scripts for common tasks.

## Package Installers

### pkg-install

**Command**: `pacgui` (alias) or `~/.config/snapsos/tuis/pkg-install.sh`  
**Binding**: `SUPER+SHIFT+Y` (commented out — alternate to shelly)

Search pacman packages: pipes `pacman -Slq` through fzf, install selected with `sudo pacman -S --noconfirm`.

### aur-install

**Command**: `aurgui` (alias) or `~/.config/snapsos/tuis/aur-install.sh`  
**Binding**: `SUPER+Y` (commented out — alternate to shelly)

Search AUR packages via yay with `aur/` prefix.

## Project Select

**Command**: `projects` (symlink) or `git-projects` (alias) — bound to `SUPER+SHIFT+TAB`  
**Location**: `~/.config/snapsos/tuis/project-select.sh`

Browse git repositories in your projects directory:
- fzf list of all git repos found under your projects directory (up to 5 levels deep)
- Preview pane shows `eza -al` file listing and `README.md` content
- Select a repo → opens `code-oss` in that directory

To change the projects directory:
```bash
echo "Documents/Projects" > ~/.config/projectdir.state
```
This sets it to `~/Documents/Projects`. Default is `~/projects`.

## Layout Switch

**Command**: `mango-layout` (symlink) — bound to `SUPER+SHIFT+W`  
**Location**: `~/.config/snapsos/tuis/layout-switch.sh`

Select a mangoWM layout from the full available list (14 layouts including scroller, tile, grid, deck, fair, monocle, dwindle).

## Bar Presets

**Command**: `SUPER+SHIFT+D`  
**Location**: `~/.config/snapsos/tuis/bar-presets.sh`

Switch between DMS bar configurations:

**Toggle items:**
- Toggle Default Top Bar
- Toggle Taskbar Style Bar
- Toggle Top Status Bar
- Toggle Left Side Bar
- Toggle Right Side Bar
- Toggle Dock

**Presets:**
- preset 1 (classic)
- preset 2 (windows-like)
- preset 3 (mac-like)
- preset 4 (combo)
- preset 5 (sidebar)
- preset 6 (side+status)

## Documentation Viewer

**Command**: `cmdhelp` (symlink) — bound to `SUPER+SHIFT+M`  
**Location**: `~/.config/snapsos/tuis/documentation.sh`

Opens quick links to documentation and reference lists:
- DMS IPC commands
- MangoWM config options
- MangoWM dispatchers
- MangoWM IPC commands
- External docs (mangoWM, DMS, Ghostty, Arch Wiki, CachyOS)
