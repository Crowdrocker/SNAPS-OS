# Customizing Themes

SNAPS-OS theming is managed through three layers: DMS themes, Matugen standalone templates, and DMS's internal template engine.

## DMS Themes

DMS ships with 38 preset themes. To switch:

1. Open DMS settings (`SUPER+S`)
2. Navigate to the theme section
3. Browse and select a preset

Themes are stored in `~/.config/DankMaterialShell/themes/`.

### Creating a Custom DMS Theme

1. Copy an existing theme:

   ```bash
   cp -r ~/.config/DankMaterialShell/themes/catppuccin ~/.config/DankMaterialShell/themes/mytheme
   ```

2. Edit `theme.json` in your new theme directory
3. Select it in DMS settings, or set `Theme_Category:preset` and `Preset:mytheme` in a wallpaper group's `wallpaper.conf`

## Matugen Palette Tuning

The `wallpaper.conf` `Matugen` key controls the color palette style:

| Style | Description |
|---|---|
| `tonal-spot` | Tone-based palette with accent spot colors |
| `vibrant` | Colorful, saturated palette |
| `content` | Content-based colors |
| `expressive` | Dramatic color variation |
| `fidelity` | Closely matches source image colors |
| `fruit-salad` | Multi-color playful palette |
| `monochrome` | Grayscale-focused |
| `neutral` | Neutral, muted tones |
| `rainbow` | Full spectrum |

### Dark/Light Mode

Set `Mode:dark` or `Mode:light` in `wallpaper.conf` to switch globally.

## Application-Specific Theming

See [Matugen configuration](../configuration/matugen.md) for standalone template apps and [DMS configuration](../configuration/dms.md) for DMS-templated apps.

## Colors in MangoWM

MangoWM's `matugen.conf` receives Matugen colors dynamically for borders, jump mode, and tabs.

## Colors in Ghostty

Ghostty themes are in `~/.config/ghostty/themes/`. The active theme (`dankcolors`) can be dynamically updated by DMS when `matugenTemplateGhostty` is enabled in DMS settings.
