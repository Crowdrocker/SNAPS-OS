# Miscellaneous Utilities

**Location**: `~/.config/snapsos/misc/`

## First-Run Setup

**Script**: `~/.config/snapsos/firstrun.sh`

Runs automatically on the first mangoWM session (triggered from `autostart.conf`). Controlled by the sentinel file `~/.config/firstrun.state`:

- Sets DMS wallpaper to the default wallpaper
- Configures DMS settings (workspace index, tag display, GTK/Qt theming, Matugen templates)
- Enables theme templates (Gtk, Pywalfox, Firefox, Qt6ct, Ghostty)
- Disables dock by default
- Sets theme to `dynamic` with `scheme-tonal-spot`
- Opens DMS settings UI and keybinds viewer for the user to explore

Removing `~/.config/firstrun.state` will trigger it again on next login.

## Scripts

| Script | Binding | Description |
|---|---|---|
| `colors.sh` | `SUPER+ALT+T` | Display current color palette in terminal. Reads from Quickshell-generated `colors.json` and renders each color as a colored block with hex value. |
| `layoutbutton.sh` | `SUPER+A` | Special layout action — toggles a specific layout feature based on current layout (zoom for master layouts, toggle gaps for grids, etc.) |
| `marker.sh` | `SUPER+J` | Mark the current workspace for quick navigation. Saves window IDs and workspace to `~/.config/marker.state` and `~/.config/marker.workspace`. |
| `swapmarked.sh` | `SUPER+SHIFT+J` | Swap the current workspace with the marked workspace. |

## Colors

`colors.sh` (`SUPER+ALT+T`) reads the Quickshell-generated Material You colors JSON and displays each color name with its hex value and a colored block in the terminal.

## Layout Toggle

`layoutbutton.sh` (`SUPER+A`) runs a context-sensitive action per layout:
- **Master layouts** (T, CT, RT, VT): zoom
- **Scrollers** (S, VS): switch proportion preset
- **Grids** (G, VG, F, VF): toggle borders + gaps
- **Dwindle**: toggle maximize screen
- **Monocle**: no action

## Workspace Markers

`marker.sh` and `swapmarked.sh` implement a mark-and-swap system:

1. `SUPER+J` — mark current workspace (saves to `marker.state` + `marker.workspace`)
2. Navigate to another workspace
3. `SUPER+SHIFT+J` — swap current workspace with the marked one
