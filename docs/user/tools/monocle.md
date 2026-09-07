# Monocle Mode — Single-Window-Per-Tag

**Location**: `~/.config/snapsos/monocle/`

Monocle mode provides a per-monitor Waybar configuration for single-window-per-tag (monocle) layouts. Each monitor gets its own Waybar instance showing only the active windows for that monitor.

## Files

| File | Purpose |
|---|---|
| `monocle.sh` | Launcher — starts Waybar per monitor |
| `config-dp1` | Waybar config for DP-1 |
| `config-dp3` | Waybar config for DP-3 |
| `config-hdmi` | Waybar config for HDMI output |
| `style.css` | Waybar styling |
| `colors.css` | Dynamic colors (from Matugen) |
| `modules-*.json` | Per-monitor module definitions |
| `fetchwindow.sh` | Gets active window info |
| `focuswindow.sh` | Focuses a specific window |
| `indexer.sh` | Indexes windows per monitor |

## Usage

Monocle is launched with the monitor name as an argument:

```bash
~/config/snapsos/monocle/monocle.sh DP-1
```

This starts Waybar with the config for DP-1, showing only the window currently focused on that monitor.

## Per-Monitor Configuration

Each monitor has its own config and module file. To add a new monitor, copy an existing config and adjust the monitor name:
