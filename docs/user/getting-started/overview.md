# Overview

SNAPS-OS is a personal dotfiles project that transforms Arch Linux into a cohesive, keyboard-driven desktop environment. It is built on four layers:

## Layer 1: Window Manager — MangoWM

[mangoWM](https://mangowm.github.io/) is a Wayland compositor and tiling window manager. SNAPS-OS ships a comprehensive configuration with:

- Custom keybindings for almost every action
- Multiple tiling layouts
- Window rules for floating/pinned windows
- DMS integration for a desktop shell experience
- Dynamic colors via Matugen

Configuration lives in `~/.config/mango/`.

## Layer 2: Desktop Shell — Dank Material Shell

[Dank Material Shell (DMS)](https://danklinux.com/docs/dankmaterialshell/) provides the desktop shell: bars, widgets, notifications, and application theming. SNAPS-OS configures DMS with custom bar presets, themes, and plugins.

Configuration lives in `~/.config/DankMaterialShell/`.

## Layer 3: Color Engine — Matugen

[Matugen](https://github.com/InioX/matugen) generates Material You color schemes from your wallpaper. SNAPS-OS provides 21 template mappings in Matugen's `config.toml` that apply colors across the desktop, plus DMS has an internal template engine for additional apps (controlled via DMS settings). The Matugen-wired apps include:

- MangoWM borders, jump mode, and tab colors
- GTK 3/4 themes
- btop, cava, tmux, yazi
- Spotify (Spicetify), Steam, prismlauncher
- Obsidian, micro, clipse
- Monocle, Wayshell, Quickshell
- KDE color scheme
- Hyprland colors
- Caffyne shell

DMS also applies Material You colors to Ghostty, Firefox, Kitty, Alacritty, VS Code, and more via its own template engine (toggled in DMS settings).

Configuration lives in `~/.config/matugen/`.

## Layer 4: Custom Tools — SNAPS-OS Scripts

The `sdgos/` directory contains all custom scripts and tools:

| Category | Tools |
|---|---|
| **Input** | Glyphs (pen gestures), Vox (voice commands) |
| **System** | Wayshell (event daemon), Monocle (window mode) |
| **TUIs** | Package managers, project browser, layout switcher, bar presets |
| **Info** | Fastfetch wrapper, help system, tips, config viewer |
| **Media** | Screenshot scripts, wallpaper groups |
| **Utilities** | Color display, layout toggle, workspace markers |
| **Shell** | Zsh config with Powerlevel10k, fzf, eza, zoxide |

All scripts are symlinked to `/usr/bin/` during installation for global access.

## Data Flow

```
Wallpaper image
    ↓
Matugen generates color scheme
    ↓
Templates apply colors to: mango, DMS, ghostty, btop, cava, ...
    ↓
User interacts via: keyboard binds → mangoWM | glyphs → gestures | vox → voice
    ↓
Wayshell daemon responds to zone/layout/focused events
```
