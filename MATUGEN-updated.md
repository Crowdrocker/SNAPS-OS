# Matugen

SNAPS-OS ships with matugen templates for auto-theming applications. These are
located in `~/.config/matugen/templates/InioX/` (sourced from InioX's template
collection, adapted for SNAPS-OS).

## Configured templates

The following applications have matugen templates set up to auto-generate:

| App | How to enable |
|-----|---------------|
| btop | Set theme to `snapsos` in btop config |
| cava | Set theme to `snapsos` in cava config |
| clipse | Set theme to `snapsos_theme` in clipse config |
| micro | Set colorscheme to `snapsos` in micro settings |
| prismlauncher | Select the snapsos theme in launcher settings |
| spotify (spicetify) | Applies automatically with Spicetify |
| tmux | Set `snapsos-colors` in tmux config |
| yazi | Applies automatically |
| steam (adwsteamgtk) | Applies automatically |
| obsidian | Colors generated to `~/.config/matugen/templates-out/obsidian.css` — symlink this to your vault under `.obsidian/snippets/theme.css` |

## Color variants

Matugen supports multiple palette variants in DMS settings:
`vibrant`, `muted`, `tonal`, `neutral`, `vibrant_dark`, `expressive`.

## Enabling matugen

Matugen runs automatically when DMS triggers a wallpaper change or when you
run `matugen image ~/path/to/wallpaper.jpg` manually. Templates are enabled
by default in the configuration.

For applications requiring manual setup (Firefox, Vesktop, VSCode), see the
DMS application theming guide: <https://danklinux.com/docs/dankmaterialshell/application-themes>
