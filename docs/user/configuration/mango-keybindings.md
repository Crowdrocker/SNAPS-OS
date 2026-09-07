# Mango Keybindings

Source file: `~/.config/mango/binds.conf`

All keybindings are defined here. Press `SUPER+K` for an interactive viewer.

## Modifier Keys

| Notation | Key |
|---|---|
| `SUPER` | Windows/Command key |
| `ALT` | Alt key |
| `CTRL/Ctrl` | Control key |
| `SHIFT` | Shift key |

## Window Management

| Binding | Action |
|---|---|
| `SUPER+Q` | Close focused window |
| `SUPER+T` | Toggle floating |
| `SUPER+F` | Toggle fullscreen |
| `SUPER+ALT+F` | Fake fullscreen (program thinks it's fullscreen) |
| `SUPER+P` | Toggle global state |
| `SUPER+SHIFT+P` | Toggle overlay mode |
| `SUPER+R` | Reload config |
| `SUPER+H` | Open command helper |
| `SUPER+SHIFT+H` | Open help menu |
| `SUPER+K` | Show keybinds viewer |

## Focus & Move

| Binding | Action |
|---|---|
| `SUPER+Arrow` | Focus in direction (left/right/up/down) |
| `SUPER+SHIFT+left/right` | Focus stack prev/next |
| `SUPER+SHIFT+up/down` | Exchange stack client prev/next |
| `SUPER+CTRL+Arrow` | Exchange client in direction |
| `SUPER+ALT+Arrow` | Resize window (±50px) |

## Tags (Workspaces)

| Binding | Action |
|---|---|
| `SUPER+1-9` | Switch to tag N |
| `SUPER+SHIFT+1-9` | Move window to tag N |
| `SUPER+alt+1-9` | Toggle tag visibility |
| `SUPER+ctrl+1-3` | Move to monitor (DP-1, HDMI-A-1, DP-2) |

## Scratchpad

| Binding | Action |
|---|---|
| `SUPER+C` | Toggle scratchpad |
| `SUPER+CTRL+C` | Minimize to scratchpad |
| `SUPER+ALT+C` | Restore minimized |
| `SUPER+ALT+SPACE` | Toggle named terminal scratchpad |

## DMS Functions

| Binding | Action |
|---|---|
| `SUPER+L` | Lock screen |
| `SUPER+SPACE` | Open runner (spotlight) |
| `SUPER+V` | Open clipboard |
| `SUPER+I` | Toggle sleep inhibit |
| `SUPER+SHIFT+T` | Toggle dark/light mode |
| `SUPER+D` | Toggle dock |
| `SUPER+X` | Open process list |
| `SUPER+SHIFT+N` | Open notifications |
| `SUPER+ESCAPE` | Toggle control center |
| `SUPER+Z` | Open power menu |
| `SUPER+S` | Open settings |

## SDG-OS Custom Scripts

| Binding | Action |
|---|---|
| `SUPER+M` | Open mango config editor |
| `SUPER+ALT+M` | Open mango config explainer |
| `SUPER+SHIFT+W` | Open layout switcher TUI |
| `SUPER+SHIFT+D` | Switch bar presets |
| `SUPER+ALT+T` | Show color palette |

## Wallpapers

| Binding | Action |
|---|---|
| `SUPER+W` | Open wallpaper group selector |
| `ALT+W` | Next wallpaper |
| `ALT+SHIFT+W` | Previous wallpaper |

## Package Managers

| Binding | Action |
|---|---|
| `SUPER+Y` | Open shelly package UI |
| `SUPER+SHIFT+Y` | Open unipkg TUI |

Alternate binds (commented out by default):
- `SUPER+Y` → AUR installer (`aur-install.sh`)
- `SUPER+SHIFT+Y` → Pacman installer (`pkg-install.sh`)

## Application Launchers

| Binding | Action |
|---|---|
| `SUPER+RETURN` | Open Ghostty terminal |
| `SUPER+TAB` | Open Ghostty terminal |
| `SUPER+E` | Open Nautilus file manager |
| `SUPER+B` | Open Firefox |
| `SUPER+N` | Open notes (DMS notepad) |

## Glyphs

| Binding | Action |
|---|---|
| `SUPER+G` | Open glyph input overlay |
| `SUPER+SHIFT+G` | Record new glyphs |
| `SUPER+CTRL+G` | Browse glyph dictionary |
| `SUPER+ALT+G` | Close glyphs |

## Other

| Binding | Action |
|---|---|
| `SUPER+SHIFT+M` | Open documentation TUI |
| `SUPER+SHIFT+TAB` | Open project browser TUI |
| `SUPER+0` | Show random tip notification |
| `ALT+TAB` | Jump mode |
| `CTRL+TAB` | Toggle overview (3s) |
| `SUPER+SHIFT+Q` | Quit mango |
| `SUPER+A` | Special layout toggle |
| `SUPER+SHIFT+A` | Switch layout |
| `SUPER+SHIFT+J` | Swap marked workspace |

## Media & System

| Binding | Action |
|---|---|
| `XF86AudioRaiseVolume` | Volume up (+5%) |
| `XF86AudioLowerVolume` | Volume down (-5%) |
| `XF86AudioMute` | Mute/unmute |
| `XF86AudioMicMute` | Mute/unmute mic |
| `XF86MonBrightnessUp` | Brightness up (+5%) |
| `XF86MonBrightnessDown` | Brightness down (-5%) |
| `XF86WLAN` | Toggle Wi-Fi |
| `XF86Refresh` | Send F5 key |

## Screenshots

| Binding | Action |
|---|---|
| `SUPER+PRINT` | Capture area (region) |
| `SUPER+CTRL+PRINT` | Capture active window |
| `NONE+PRINT` | Cycle screenshot save mode |
| `SUPER+SHIFT+PRINT` | Capture monitor (output) |
| `SUPER+CTRL+SHIFT+PRINT` | Capture all screens |

## Mouse

| Binding | Action |
|---|---|
| `SUPER+btn_left` | Move floating window |
| `SUPER+btn_right` | Resize floating window |
| `SUPER+btn_middle` | Toggle maximize |

## Scroll

| Binding | Action |
|---|---|
| `SUPER+scroll up` | View left |
| `SUPER+scroll down` | View right |
