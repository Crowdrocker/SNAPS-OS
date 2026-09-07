# Scripts-Only Install

If you already have your own mangoWM, DMS, or terminal configuration and only want the SNAPS-OS custom tools, use `install-scriptsonly.sh`:

```bash
cd ~/SNAPS-OS
chmod a+x install-scriptsonly.sh
./install-scriptsonly.sh
```

This copies the `snapsos/` directory to `~/.config/snapsos/`, creates `~/.config/projectdir.state`, and symlinks scripts to `/usr/bin/`.

## What Gets Installed

| Command | Source script |
|---|---|
| `glyphs` | `snapsos/glyphs/glyphs-cli.py` |
| `fetch` | `snapsos/fastfetch/fetch.sh` |
| `fetchconf` | `snapsos/fastfetch/fetch-conf.sh` |
| `mangoconf-viewer` | `snapsos/config-overview/menu.sh` |
| `mango-layout` | `snapsos/tuis/layout-switch.sh` |
| `cmdhelp` | `snapsos/help/cmd-help.sh` |
| `projects` | `snapsos/tuis/project-select.sh` |
| `wallpaper-select` | `snapsos/wallpapers/setwallpapergroup.sh` |

Note: `mangoconf-editor` and `vox` are also symlinked by the scripts-only install (`install-scriptsonly.sh` has them both, unlike the doc originally stated).

## What Is Not Installed

- MangoWM config (`mango/`)
- DMS config (`DankMaterialShell/`)
- Ghostty config (`ghostty/`)
- Matugen templates (`matugen/`)
- Zsh config
