# scripts

The following scripts are provided as system commands by both `install.sh` and
`install-scriptsonly.sh`:

---

`fetchconf` and `fetch`

- `fetchconf` — TUI to configure the fastfetch wrapper. Select ASCII artwork
  from `~/.config/snapsos/fastfetch/gen/`. Images in `~/.config/snapsos/fastfetch/src/`
  are converted to ASCII via `jp2a` on each TUI start. Select a config from
  `~/.config/snapsos/fastfetch/conf/`.
- `fetch` — runs fastfetch with the configured image and config.
- Selection stored in `~/.config/fetch.state`.

---

`mangoconf-viewer` and `mangoconf-editor`

- List config files in `~/.config/mango/` with preview.
- `mangoconf-editor`: opens selected file in micro.
- `mangoconf-viewer`: line-by-line config browser with setting details.

---

`cmdhelp`

TUI listing common Linux commands with TLDR preview. Press Enter to open
the man page.

---

`mango-layout`

TUI to select the mangoWM layout on the current focused monitor/tag.

---

`projects`

Browse git repositories in your projects directory (default `~/projects`).
Shows file listing and README preview. Select to open in code-oss/VSCode.

Change directory:
```
echo "mydir" > ~/.config/projectdir.state
```

---

`wallpaper-select`

Select wallpaper groups with DMS integration. Each group folder has a
`wallpaper.conf`:

```
Theme_Category:dynamic   # generic / dynamic / custom / registry
Generic_Color:dynamic     # color name, dynamic, or custom
Matugen:vibrant           # palette variant
Mode:dark                 # dark or light
Preset:-                  # theme preset (registry/custom only)
```

The first image in the folder is the starting wallpaper. Cycling is handled
by DMS, not the script.
