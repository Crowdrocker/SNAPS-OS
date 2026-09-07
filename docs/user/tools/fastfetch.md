# Fastfetch Wrapper

**Commands**: `fetch`, `fetchconf`  
**Location**: `~/.config/snapsos/fastfetch/`

SNAPS-OS wraps [fastfetch](https://github.com/fastfetch-cli/fastfetch) with a custom TUI for selecting ASCII art and configuration presets.

## fetchconf

**Command**: `fetchconf`

TUI for configuring the fetch output:

1. **Select ASCII art**: browse generated art in `~/.config/snapsos/fastfetch/gen/`
2. **Select config preset**: pick a formatting preset from `~/.config/snapsos/fastfetch/conf/`
3. **Image conversion**: `update-files.sh` converts `.jpg`, `.jpeg`, `.png`, `.webp` images from `src/` to ASCII using `jp2a --height=22 --colors --background=dark`

Selection is saved to `~/.config/fetch.state` in `logo:config` format.

## fetch

**Command**: `fetch`

Runs fastfetch with the selected ASCII art and configuration preset from `~/.config/fetch.state`.

Default state: `none:default.jsonc`

## Directory Structure

| Path | Purpose |
|---|---|
| `conf/` | Fastfetch configuration presets |
| `gen/` | Generated ASCII art from images |
| `src/` | Source images for ASCII conversion |
| `fetch.sh` | Main fetch command |
| `fetch-conf.sh` | Config TUI |
| `update-files.sh` | Converts source images to ASCII art via jp2a |
