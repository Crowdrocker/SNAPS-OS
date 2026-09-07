# Customizing Wallpapers

## Adding a New Wallpaper Group

1. Create a new directory under `~/.config/snapsos/wallpapers/`:

   ```bash
   mkdir -p ~/.config/snapsos/wallpapers/mytheme
   ```

2. Add your images to the directory (PNG, JPG, JPEG, WEBP):

   ```bash
   cp ~/Downloads/my-wallpaper.png ~/.config/snapsos/wallpapers/mytheme/
   ```

3. Create a `wallpaper.conf` file in the directory (no spaces around `:`):

   ```
   Theme_Category:dynamic
   Matugen:vibrant
   Mode:dark
   Preset:-
   ```

4. The group will now appear in the wallpaper selector (`SUPER+W`).

## wallpaper.conf Options

| Key | Options | Description |
|---|---|---|
| `Theme_Category` | `generic` — fixed DMS color | Theming method |
| | `dynamic` — use Matugen (recommended) | |
| | `preset` — use a DMS preset theme | |
| `Generic_Color` | `blue`, `purple`, `green`, `orange`, `red`, `cyan`, `pink`, `amber`, `coral`, `white`, `dynamic`, or `custom` | Color when using generic/custom category |
| `Matugen` | `tonal-spot`, `vibrant`, `content`, `expressive`, `fidelity`, `fruit-salad`, `monochrome`, `neutral`, `rainbow` | Matugen palette style |
| `Mode` | `dark` or `light` | Color mode |
| `Preset` | Theme folder name (from `~/.config/DankMaterialShell/themes/`) or `-` | DMS preset theme |

> Note: Remove all comments from `wallpaper.conf` — the format does not support `#` comments.

## Image Cycling

- Images cycle alphabetically by filename
- A group with one image does not cycle
- Cycling is handled by DMS (`dms ipc call wallpaper next/prev`)
