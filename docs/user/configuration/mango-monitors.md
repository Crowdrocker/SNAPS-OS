# Mango Monitor Configuration

Source file: `~/.config/mango/monitors.conf`

Defines display outputs using `monitorrule=` syntax.

## Syntax

```
monitorrule=name:<regex>,width:<px>,height:<px>,refresh:<hz>,x:<px>,y:<px>
```

| Field | Example | Description |
|---|---|---|
| `name` | `^DP-1$` | Regex matching output name |
| `width` | `1920` | Horizontal resolution in pixels |
| `height` | `1080` | Vertical resolution in pixels |
| `refresh` | `60` | Refresh rate in Hz |
| `x` | `0` | X position (for multi-monitor layout) |
| `y` | `0` | Y position (for multi-monitor layout) |

## Default Layout

Example 3-monitor setup:

```
monitorrule=name:^HDMI-A-1$,width:1920,height:1080,refresh:60,x:1920,y:0
monitorrule=name:^DP-1$,width:1920,height:1080,refresh:60,x:0,y:0
monitorrule=name:^DP-2$,width:1920,height:1080,refresh:60,x:3840,y:0
```

## Other Settings

| Setting | Default | Description |
|---|---|---|
| `focus_cross_monitor` | `1` | Allow focus across monitors |
| `exchange_cross_monitor` | `1` | Allow window exchange across monitors |
| `syncobj_enable` | `1` | Enable sync object sharing |

## Useful Commands

- `mmsg dispatch setoption,monitorrule,...` — set monitor rule at runtime
- `dms ipc call settings toggle` — open DMS settings for display configuration

## Hotplug

mangoWM supports hotplug — connecting or disconnecting monitors at runtime is handled automatically. New displays use the first available rule or a fallback mode.
