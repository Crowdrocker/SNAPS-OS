# Matugen Color Engine Configuration

Material You color theme generator. Extracts a color palette from a wallpaper
image and generates themed config files for applications.

## Structure

| Path | Purpose |
|------|---------|
| `templates/InioX/` | Application templates (btop, cava, yazi, etc.) |
| `templates/kde/` | KDE Plasma color template |
| `config.toml` | Template configuration (input/output paths, hooks) |

## Templates

Templates are enabled in `config.toml`. Each template generates a themed config
file from a wallpaper's color palette. Applications supported:

btop, cava, clipse, micro, prismlauncher, spicetify (spotify), tmux, yazi,
steam (adwsteamgtk), obsidian, neovim, rofi, waybar, dunst, kitty, alacritty,
ghostty, and more (58+ InioX templates).

## Usage

```sh
# Manual generation
matugen image ~/wallpaper.jpg

# DMS triggers matugen automatically on wallpaper change
```

## Docs

<https://github.com/InioX/matugen>
