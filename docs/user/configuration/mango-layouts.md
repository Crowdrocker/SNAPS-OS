# Mango Layouts

Source file: `~/.config/mango/layouts.conf`

Layouts control how windows are arranged on a tag (workspace).

## Cycle Layouts

The `circle_layout` defines which layouts are cycled through when switching layouts:

```
circle_layout=dwindle,scroller,vertical_scroller,center_tile,tile
```

| Layout | Description |
|---|---|
| **Dwindle** | Recursive binary splitting in spiral pattern |
| **Scroller (horizontal)** | Windows scroll horizontally |
| **Scroller (vertical)** | Windows scroll vertically |
| **Center Tile** | Master window centered, others tiled around |
| **Tile** | Master-stack layout (master on left) |

## All Available Layouts

Additional layouts can be set via the layout switcher TUI (`SUPER+SHIFT+W`):

| Layout | Command |
|---|---|
| Scroller - horizontal | `setlayout,scroller` |
| Scroller - vertical | `setlayout,vertical_scroller` |
| Tile/master - left | `setlayout,tile` |
| Tile/master - top | `setlayout,vertical_tile` |
| Tile/master - center | `setlayout,center_tile` |
| Tile/master - right | `setlayout,right_tile` |
| Grid - horizontal | `setlayout,grid` |
| Grid - vertical | `setlayout,vertical_grid` |
| Deck - horizontal | `setlayout,deck` |
| Deck - vertical | `setlayout,vertical_deck` |
| Fair - horizontal | `setlayout,fair` |
| Fair - vertical | `setlayout,vertical_fair` |
| Monocle | `setlayout,monocle` |
| Dwindle | `setlayout,dwindle` |

## Per-Tag Layouts

Each tag has a default layout set via `tagrule=`. By default, all 9 tags use `dwindle`.

## Layout Settings

Key layout settings in `layouts.conf`:

- **Master-Stack**: `new_is_master=1`, `default_mfact=0.75`, `default_nmaster=1`
- **Dwindle**: `dwindle_smart_split=0`, `dwindle_preserve_split=1`
- **Scroller**: `scroller_structs=20`, `scroller_default_proportion=0.8`
- **Overview**: `enable_hotarea=1`, `ov_tab_mode=1`
- **Gaps**: gap settings are in `dms/layout.conf` (`gappih=4`, `gappiv=4`, etc.)
