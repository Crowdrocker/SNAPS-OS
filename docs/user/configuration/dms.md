# Dank Material Shell (DMS)

Configuration directory: `~/.config/DankMaterialShell/`

Dank Material Shell transforms mangoWM into a full desktop environment with bars, widgets, notifications, application theming, and settings panels.

## Files

| File | Purpose |
|---|---|
| `settings.json` | All DMS settings — bars, widgets, themes, behavior |
| `theme.json` | Current active theme (starts empty — set on first config) |
| `plugin_settings.json` | Plugin-specific settings |
| `clsettings.json` | Command-line settings |
| `firefox.css` | Firefox theme CSS |
| `old.json` | Previous theme backup |
| `themes/` | 38 preset theme directories |
| `plugins/` | DMS plugin scripts |
| `.changelog-1.4` | DMS version changelog |
| `.firstlaunch` | First-launch marker |

## Themes

DMS themes control the entire desktop look: bar colors, widget styles, notification appearance, and application themes.

38 preset themes include Catppuccin (all variants), Rose Pine, Gruvbox, Nord, Tokyo Night, Dracula, and more. Select a theme via the DMS settings UI.

## Application Theming via DMS

DMS has a built-in template engine (separate from the standalone Matugen CLI) that applies Material You colors to applications. These are controlled by `matugenTemplate*` settings in `settings.json`:

| Setting | Applies colors to |
|---|---|
| `matugenTemplateGhostty` | Ghostty terminal |
| `matugenTemplateFirefox` | Firefox |
| `matugenTemplateGtk` | GTK themes |
| `matugenTemplateQt5ct/6ct` | Qt applications |
| `matugenTemplateKitty/Alacritty/Foot/Wezterm` | Terminal emulators |
| `matugenTemplateVscode/Emacs/Zed/Neovim` | Code editors |
| `matugenTemplateNiri/Hyprland/Mangowc` | Compositors |
| `matugenTemplateVesktop/Equibop` | Discord clients |
| `matugenTemplateZenBrowser` | Zen browser |
| `matugenTemplateKcolorscheme` | KDE color scheme |
| `matugenTemplatePywalfox` | Pywalfox |
| `matugenTemplateDgop` | Descent 3 game theme |

Toggle these on/off in the DMS settings UI.

## Bar Presets

SDG-OS ships a bar preset switcher (`SUPER+SHIFT+D`) with presets including classic, windows-like, mac-like, combo, sidebar, and side+status styles.

## Plugins

### DankActions

Custom action scripts triggered by DMS events.

### DankPinentry

A DMS-integrated PIN entry dialog for GPG/SSH key management.

### SSHConnections

An SSH connection manager plugin providing a TUI within DMS.

## Documentation

Full DMS documentation: [danklinux.com/docs/dankmaterialshell/](https://danklinux.com/docs/dankmaterialshell/)
