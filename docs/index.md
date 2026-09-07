# SNAPS-OS Documentation

Welcome to the SNAPS-OS documentation. SNAPS-OS is a complete dotfiles and desktop environment configuration built around **mangoWM** (Wayland compositor) with **Dank Material Shell (DMS)** integration and **Matugen**-powered Material You auto-theming.

## Quick Links

- [User Guide](user/index.md) — installation, configuration, tools, customization
- [Developer Guide](dev/index.md) — architecture, internals, extending

## Structure

```
user/              User-facing documentation
  getting-started  Installation & setup
  configuration    Component configuration references
  tools            Tool usage guides
  customization    Personalization guides

dev/               Developer documentation
  project-structure
  glyphs / vox / wayshell   Internals & extending
  contributing
```

## Components

| Component | User Docs | Dev Docs | Description |
|---|---|---|---|
| Mango WM | [config](user/configuration/mango.md) / [keybinds](user/configuration/mango-keybindings.md) / [layouts](user/configuration/mango-layouts.md) / [monitors](user/configuration/mango-monitors.md) | — | Wayland compositor |
| Dank Material Shell | [dms](user/configuration/dms.md) | — | Desktop shell / bar |
| Ghostty | [ghostty](user/configuration/ghostty.md) | — | Terminal emulator |
| Matugen | [matugen](user/configuration/matugen.md) | — | Material You color engine |
| Zsh | [zsh](user/configuration/zsh.md) | — | Shell configuration |
| Glyphs | [glyphs](user/tools/glyphs.md) | [dev](dev/glyphs.md) | Pen gesture system |
| Vox | [vox](user/tools/vox.md) | [dev](dev/vox.md) | Voice command system |
| Wayshell | [wayshell](user/tools/wayshell.md) | [dev](dev/wayshell.md) | Event manager daemon |
| Monocle | [monocle](user/tools/monocle.md) | — | Per-monitor Waybar |
| TUI Scripts | [tuis](user/tools/tuis.md) | — | fzf-based terminal UIs |
| Fastfetch | [fastfetch](user/tools/fastfetch.md) | — | System fetch wrapper |
| Wallpapers | [wallpapers](user/tools/wallpapers.md) | — | Wallpaper group system |
| Screenshots | [screenshots](user/tools/screenshots.md) | — | Screenshot utilities |
| Help & Tips | [help-and-tips](user/tools/help-and-tips.md) | — | Built-in help system |
| Config Overview | [config-overview](user/tools/config-overview.md) | — | Config browser/checker |
