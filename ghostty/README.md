# Ghostty Terminal Configuration

Pre-configured Ghostty terminal emulator setup with DMS theme integration.

## Features

- DMS Material You theme sync (colors update with wallpaper)
- Zsh as default shell with Powerlevel10k prompt
- Multi-pane keybinds: `Alt+Arrow` to split, `Ctrl+R` to reload
- Mouse-resizable panes with auto-focus on hover

## Key files

| File | Purpose |
|------|---------|
| `config` | Main Ghostty configuration |
| `themes/` | Theme files (DMS-generated + custom) |

## Notes

- Replaces the built-in theme on DMS color changes
- Alternative themes can be placed in `themes/` and selected in `config`
