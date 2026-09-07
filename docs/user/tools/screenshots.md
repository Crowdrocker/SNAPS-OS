# Screenshot System

**Location**: `~/.config/snapsos/wayshell/configs/` (active), `~/.config/snapsos/screenshots/` (deprecated)

The current screenshot system uses scripts in `wayshell/configs/` bound to keyboard shortcuts. The old scripts in `screenshots/` are deprecated.

## Keybindings (current)

| Binding | Action |
|---|---|
| `SUPER+PRINT` | Capture area (region select) |
| `SUPER+CTRL+PRINT` | Capture active window |
| `SUPER+SHIFT+PRINT` | Capture current monitor |
| `SUPER+CTRL+SHIFT+PRINT` | Capture all screens |
| `PRINT` | Cycle screenshot save mode |

## Capture Modes

Screenshots can be saved in three modes, cycled with `PRINT`:

1. **Disk** — saves to `~/Pictures/Screenshots/` with timestamp
2. **Clipboard** — copies to clipboard (no file saved)
3. **Editor** — opens in editor (default: gimp, configured in `~/.config/screenshot.state`)

## How It Works

- `ss-capture.sh` — main capture script, takes a target argument (`area`, `active`, `output`, `screen`)
- Uses `grim` for capture and `slurp` for region selection
- Mode and save directory are stored in `~/.config/screenshot.state`
- Editor is configurable in the state file

## Deprecated Scripts

The old scripts at `~/.config/snapsos/screenshots/` (`region.sh`, `fullscreen.sh`, `mode-toggle.sh`) use `hyprshot` + `satty` and are no longer bound to any keybinding.

## Dependencies

- `grim` — Wayland screenshot utility
- `slurp` — region selection
- `wl-clipboard` — clipboard integration
- `gimp` — default editor (configurable)
