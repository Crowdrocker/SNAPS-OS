# Project Structure

The root of the repository contains configuration directories that get copied to `~/.config/`.

```
SDG-OS/
├── mango/                    MangoWM Wayland compositor config
│   ├── config.conf           Main entry point
│   ├── autostart.conf        Auto-start programs
│   ├── binds.conf            Keybindings
│   ├── decoration.conf       Window borders, gaps, blur
│   ├── environment.conf      Env vars for mango session
│   ├── input.conf            Touchpad, mouse, keyboard
│   ├── layouts.conf          Tiling layout definitions
│   ├── monitors.conf         Display outputs
│   ├── windowrules.conf      Floating/pinned window rules
│   ├── matugen.conf          Matugen-generated dynamic colors
│   └── dms/                  DMS-mango bridge configs
│
├── ghostty/                  Ghostty terminal config
│   ├── config.ghostty
│   └── themes/
│
├── DankMaterialShell/        DMS desktop shell config
│   ├── settings.json         Main DMS settings
│   ├── theme.json            Current theme
│   ├── plugin_settings.json
│   ├── clsettings.json
│   ├── firefox.css           Firefox theme CSS
│   ├── plugins/              DMS plugin scripts
│   │   ├── dankActions/
│   │   ├── dankPinentry/
│   │   └── sshConnections/
│   └── themes/               38 preset themes
│
├── matugen/                  Matugen color engine
│   ├── config.toml           21 template mappings
│   ├── templates/            Template files
│   │   ├── colors.json       M3 color scheme
│   │   ├── gtk-3.0/          GTK themes
│   │   ├── hyprland/         Hyprland colors
│   │   ├── fuzzel/           App launcher
│   │   ├── InioX/            Community templates (btop, cava, etc.)
│   │   └── ...
│   ├── template-out/         Generated outputs
│   └── templates-out/        Additional outputs
│
├── snapsos/                    Custom scripts & tools
│   ├── zshrc                 Zsh config (copied to ~/.zshrc)
│   ├── zshconfig.zsh         Additional Zsh settings
│   ├── p10k.zsh              Powerlevel10k config (copied to ~/.p10k.zsh)
│   ├── wallpaper.png         Default wallpaper
│   ├── mango-config.sh       Mango config editor TUI
│   ├── glyphs/               Pen gesture system (Python)
│   │   ├── glyphs-cli.py     CLI entry point
│   │   ├── config.json       Gesture config
│   │   ├── glyphs/           Python package (13 modules)
│   │   └── glyphs-data/      JSON gesture definitions
│   ├── vox/                  Voice command system (Python)
│   │   ├── vox.sh            Shell wrapper
│   │   ├── config.json       Command tree
│   │   ├── pyproject.toml    Python project metadata
│   │   ├── vox/              Python package (14 modules)
│   │   ├── models/           Whisper/Vosk model files
│   │   └── vox-config.desktop
│   ├── wayshell/             Event manager daemon (Bash)
│   │   ├── wayshell.sh       Main daemon
│   │   ├── wayshell.conf     Debounce config
│   │   ├── wayshell.modules  Module definitions
│   │   ├── modules/          Event source scripts
│   │   └── configs/          JSON configs
│   ├── monocle/              Monocle Waybar mode
│   │   ├── monocle.sh        Per-monitor launcher
│   │   ├── config-*          Per-monitor Waybar configs
│   │   └── style.css
│   ├── fastfetch/            Fastfetch wrapper
│   │   ├── fetch.sh
│   │   ├── fetch-conf.sh
│   │   ├── conf/             Config presets
│   │   ├── gen/              Generated ASCII art
│   │   └── src/              Source images
│   ├── wallpapers/           55+ wallpaper groups
│   ├── tuis/                 fzf TUI scripts
│   ├── help/                 Help topics & reference lists
│   ├── tips/                 Tips system
│   ├── screenshots/          Screenshot scripts
│   ├── misc/                 Misc utilities
│   └── config-overview/      Mango config browser
│
├── install.sh                Full system installer
├── install-scriptsonly.sh    Scripts-only installer
├── update.sh                 Update script
├── README.md                 README
├── MATUGEN.md                Matugen template guide
├── SCRIPTS.md                Script reference
├── TODO.md                   Future integration ideas
│
└── docs/                     This documentation
```

## Symlinked Commands

During installation, scripts are symlinked to `/usr/bin/`:

| Symlink | Target |
|---|---|
| `/usr/bin/fetch` | `snapsos/fastfetch/fetch.sh` |
| `/usr/bin/fetchconf` | `snapsos/fastfetch/fetch-conf.sh` |
| `/usr/bin/mangoconf-viewer` | `snapsos/config-overview/menu.sh` |
| `/usr/bin/mangoconf-editor` | `snapsos/mango-config.sh` |
| `/usr/bin/cmdhelp` | `snapsos/help/cmd-help.sh` |
| `/usr/bin/mango-layout` | `snapsos/tuis/layout-switch.sh` |
| `/usr/bin/projects`  | `snapsos/tuis/project-select.sh` (note: install.sh symlinks to `projectselect.sh` which is a broken path — actual file has hyphen) |
| `/usr/bin/wallpaper-select` | `snapsos/wallpapers/setwallpapergroup.sh` |
| `/usr/bin/glyphs` | `snapsos/glyphs/glyphs-cli.py` |
| `/usr/bin/vox` | `snapsos/vox/vox.sh` |
