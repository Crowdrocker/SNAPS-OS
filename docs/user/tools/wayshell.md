# Wayshell — Module Event Manager

**Command**: auto-started via mangowm `autostart.conf`  
**Location**: `~/.config/snapsos/wayshell/`

Wayshell is an event-driven daemon that monitors mangoWM state changes (active zone, layout, focused window) and triggers module actions with configurable debouncing.

## How It Works

1. Event source scripts (`zone.sh`, `layout.sh`, `focused.sh`) monitor mangoWM state
2. When state changes, the daemon dispatches ON/OFF actions defined in `wayshell.modules`
3. Actions are debounced using trailing-edge logic

## Configuration

### wayshell.conf

| Key | Default | Description |
|---|---|---|
| `zone_buffer` | `30` | Distance in pixels from screen edge defining a "zone" (not a timing value) |
| `on_delay` | `300` ms | Default debounce delay before triggering ON action |
| `off_delay` | `500` ms | Default debounce delay before triggering OFF action |
| `zone_on_delay` | `300` ms | Zone-specific ON delay |
| `zone_off_delay` | `1500` ms | Zone-specific OFF delay |
| `layout_on_delay` | `200` ms | Layout-specific ON delay |
| `layout_off_delay` | `0` ms | Layout-specific OFF delay |
| `focused_on_delay` | `50` ms | Focused-specific ON delay |
| `focused_off_delay` | `500` ms | Focused-specific OFF delay |

### wayshell.modules

Defines modules as pipe (`|`)-separated records:

```
name|on_exec|off_exec|type|args
```

| Field | Description |
|---|---|
| `name` | Module identifier |
| `on_exec` | Command to run when module activates |
| `off_exec` | Command to run when module deactivates |
| `type` | Event source type (`zone`/`layout`/`focused`) |
| `args` | Arguments passed to the event source |

## Event Sources

- **Zone** — monitors active DMS zone (desktop, overlay, lockscreen). Uses pixel-edge detection.
- **Layout** — monitors current mango layout
- **Focused** — monitors properties of the focused window (class, title)

## Logs

Daemon output is logged to `/tmp/wayshell_daemon.log`.
