# Ghostty Terminal

Configuration directory: `~/.config/ghostty/`

## Files

| File | Purpose |
|---|---|
| `config.ghostty` | Main configuration |
| `themes/` | Custom theme files (`dankcolors`, `noctalia`) |

## Key Settings

- **Theme**: `dankcolors` (a static theme file in `themes/`)
- **Shell**: configured to use Zsh (with fetch + tips on launch)
- **Opacity**: 0.5 background opacity
- **Window**: no decoration, focus-follows-mouse, link URLs and previews
- **Scrollback**: 1,048,576,000 lines

## Keybindings

| Binding | Action |
|---|---|
| `ALT+up` | New split up |
| `ALT+down` | New split down |
| `ALT+left` | New split left |
| `ALT+right` | New split right |
| `CTRL+R` | Reload config |

## Panes

- Split with `ALT+Arrow` keys
- Exit a pane by typing `exit`
- Panes are auto-focused on mouse hover
- Panes can be resized with mouse drag

## Dynamic Theming

When DMS's `matugenTemplateGhostty` setting is enabled (in DMS `settings.json`), DMS dynamically regenerates the `dankcolors` theme file whenever the wallpaper/color scheme changes, keeping Ghostty colors in sync with the desktop theme.

Custom themes are in `themes/`:
- `dankcolors` — Default active theme
- `noctalia` — Alternative dark theme
