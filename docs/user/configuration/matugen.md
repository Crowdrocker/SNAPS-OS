# Matugen Color Engine

Configuration directory: `~/.config/matugen/`

[Matugen](https://github.com/InioX/matugen) generates Material You color schemes from wallpaper images and applies them across your desktop via templates.

## Files

| File/Directory | Purpose |
|---|---|
| `config.toml` | 21 template mappings (which templates to generate) |
| `templates/` | Template files for various applications |
| `templates/InioX/` | Community templates (60+ templates for many apps) |
| `templates-out/` | Generated output files (singular `template-out/` does not exist) |
| `templates-out/` | Additional output directory |

## Standalone Matugen Templates (config.toml)

These 21 templates are wired up in `config.toml` and regenerate whenever Matugen runs:

| Template | Output | Application |
|---|---|---|
| `m3colors` | `~/.local/state/quickshell/.../colors.json` | Quickshell M3 colors |
| `hyprland` | `~/.config/hypr/hyprland/colors.conf` | Hyprland compositor |
| `hyprlock` | `~/.config/hypr/hyprlock/colors.conf` | Hyprlock screen |
| `gtk3` | `~/.config/gtk-3.0/gtk.css` | GTK3 themes |
| `gtk4` | `~/.config/gtk-4.0/gtk.css` | GTK4 themes |
| `kde_colors` | `~/.local/state/quickshell/.../color.txt` | KDE/quickshell colors |
| `wallpaper` | `~/.local/state/quickshell/.../path.txt` | Wallpaper path |
| `btop` | `~/.config/btop/themes/snapsos.theme` | btop system monitor |
| `cava` | `~/.config/cava/themes/snapsos` | Cava audio visualizer |
| `clipse` | `~/.config/clipse/snapsos_theme.json` | Clipse clipboard |
| `micro` | `~/.config/micro/colorschemes/snapsos.micro` | Micro editor |
| `prismlauncher` | `~/.local/share/PrismLauncher/.../theme.json` | Prism Launcher |
| `spotify` | `~/.config/spicetify/Themes/Sleek/color.ini` | Spotify (Spicetify) |
| `tmux` | `~/.config/tmux/snapsos-colors.conf` | Tmux status bar |
| `yazi` | `~/.config/yazi/theme.toml` | Yazi file manager |
| `steam` | `~/.config/AdwSteamGtk/custom.css` | Steam (AdwSteamGtk) |
| `obsidian` | `~/.config/matugen/templates-out/obsidian.css` | Obsidian notes |
| `mangocolors` | `~/.config/mango/matugen.conf` | MangoWM colors |
| `monocle` | `~/.config/snapsos/monocle/colors.css` | Monocle mode |
| `caffyne` | `~/.config/caffyne-shell/style/colors.css` | Caffyne shell |
| `wayshellbars` | `~/.config/snapsos/wayshell/configs/colors.css` | Wayshell bars |

## DMS-Templated Applications

DMS has its own internal template engine (separate from Matugen CLI) that can also apply Material You colors. See [DMS documentation](dms.md) for the full list of DMS-managed templates.

## How to Enable Per-Application

| Application | How to Enable |
|---|---|
| **MangoWM** | Applied automatically via `mangocolors` template |
| **GTK 3/4** | Applied automatically |
| **btop** | Set btop theme to `snapsos` in btop's config |
| **cava** | Set cava theme to `snapsos` in cava's config |
| **clipse** | Set clipse theme to `snapsos_theme` in clipse's config |
| **micro** | Set color scheme to `snapsos` in micro's settings |
| **prismlauncher** | Select `snapsos` theme in settings |
| **Spicetify** | Applies automatically |
| **tmux** | Configure tmux to include `snapsos-colors.conf` |
| **yazi** | Applies automatically |
| **Steam** | Applies automatically (via AdwSteamGtk) |
| **Obsidian** | Symlink `templates-out/obsidian.css` to `.obsidian/snippets/theme.css` |

## How It Works

1. When you change your wallpaper (via `SUPER+W` or the wallpaper group system), Matugen runs
2. Matugen extracts a Material You color palette from the wallpaper
3. Templates are rendered with the new palette
4. Applications that watch their config files reload automatically

## Changing the Color Scheme

The `wallpaper.conf` in each wallpaper group controls Matugen behavior:

```
Theme_Category:dynamic
Matugen:vibrant
Mode:dark
```
