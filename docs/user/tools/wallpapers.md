# Wallpaper System

**Commands**: `wallpaper-select`, `SUPER+W`, `ALT+W`, `ALT+SHIFT+W`  
**Location**: `~/.config/snapsos/wallpapers/`

SDG-OS organizes wallpapers into named groups (~55 groups). Each group contains images and a `wallpaper.conf` that controls Matugen color generation and DMS theming.

## Usage

| Binding | Action |
|---|---|
| `SUPER+W` | Open wallpaper group selector |
| `ALT+W` | Next wallpaper in current group |
| `ALT+SHIFT+W` | Previous wallpaper in current group |

You can also call the script directly:

```bash
wallpaper-select default
```

## Wallpaper Groups

Groups are simply directories under `~/.config/snapsos/wallpapers/`. SDG-OS ships with ~55 groups including: default, terminal, anime, arch, catppuccin, nord, gruvbox, tokyo-night, rose-pine, dracula, and more.

## wallpaper.conf Format

Each group has a `wallpaper.conf`. Format is one key per line, no spaces around `:`:

```
Theme_Category:dynamic
Matugen:vibrant
Mode:dark
Preset:-
```

| Key | Options | Description |
|---|---|---|
| `Theme_Category` | `generic` (fixed color), `dynamic` (Matugen auto), `preset` (registry) | Theming method |
| `Generic_Color` | Color name or empty | DMS generic color (used with `generic` category) |
| `Matugen` | `tonal-spot`, `vibrant`, `content`, `expressive`, `fidelity`, `fruit-salad`, `monochrome`, `neutral`, `rainbow` | Matugen palette style |
| `Mode` | `dark` or `light` | Color mode |
| `Preset` | Theme folder name or `-` | DMS preset theme |

> The config format does not support comments. Remove any `#` before use.

## Image Cycling

- Images cycle alphabetically by filename
- Groups with a single image do not cycle
- Cycling is handled by DMS (`dms ipc call wallpaper next/prev`)
