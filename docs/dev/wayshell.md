# Wayshell — Developer Documentation

**Location**: `~/.config/snapsos/wayshell/` (Bash daemon)

## Architecture

```
wayshell.sh             Main daemon (event loop in Bash)
├── wayshell.conf       Configuration (debounce timings, zone buffer)
├── wayshell.modules    Module definitions (pipe-separated)
├── modules/            Event source scripts
│   ├── zone.sh         Polls cursor position, emits enter/exit events
│   ├── layout.sh       Watches mmsg watch all-tags for layout changes
│   └── focused.sh      Watches mmsg watch focusing-client for focus changes
└── configs/            ON/OFF action scripts and Waybar configurations
```

## Daemon Loop

1. **Read config** — load `wayshell.conf` for debounce values
2. **Read modules** — load `wayshell.modules` for module definitions
3. **Spawn event sources** — run each module's event source script with
   auto-restart (`while true; do script; sleep 0.5; done`)
4. **Process events** — when an event source emits a line, route it to the
   appropriate `process_*_event` handler based on the source prefix
   (`zone:`, `layout:`, `focused:`)
5. **Fire ON/OFF actions** — `check_fires()` runs every ~50ms and triggers
   `on_exec` or `off_exec` commands once debounce timers expire
6. **Debounce** — trailing-edge debounce for OFF transitions; re-entering
   during `pending_off` returns to `enabled` without firing OFF

## Module Definition Format

`wayshell.modules` uses pipe (`|`) as separator:

```
name|on_exec|off_exec|type|args
```

Parsed at `wayshell.sh:55`:
```bash
while IFS='|' read -r name onexec offexec type args; do
    name="${name// /}"
    [[ "$name" =~ ^#.*$ || -z "$name" ]] && continue
    MODULES["$name"]="$onexec|$offexec|$type|$args"
    MODULE_STATES["$name"]="disabled"
done < "$MODULES_FILE"
```

### Type-specific args

| Type | Args | Format | Example |
|------|------|--------|---------|
| `zone` | Monitor-local bounding box | `x1,y1,x2,y2` | `0,300,40,780` |
| `layout` | Layout code + optional monitor | `code[,monitor]` | `M,DP-1` |
| `focused` | Application ID | `app_id` | `firefox` |

## Event Source Protocol

Event sources must continuously output newline-delimited JSON to stdout.
Each line is prefixed by the daemon with the source label.

### Writing a zone-type event source

Output format:
- **Enter**: `{"x":<float>,"y":<float>,"monitor":"<name>"}`
- **Exit**: `{"state":"exit","x":<float>,"y":<float>,"monitor":"<name>"}`

Coordinates must be **absolute** screen coordinates (not monitor-local). The
daemon converts to monitor-local internally using a monitor offset cache.

### Writing a layout-type event source

Output format:
```json
{"layout":"M","state":"active","monitor":"DP-1","tag":2}
{"layout":"DW","state":"inactive","monitor":"DP-1","tag":2}
```

Must emit `inactive` for the previous layout before `active` for the new one.

### Writing a focused-type event source

Output format:
```json
{"app_id":"firefox","state":"focused"}
{"app_id":"firefox","state":"unfocused"}
```

Must track previous app_id to emit `unfocused` when focus changes.

### Auto-restart

All event sources are wrapped in an auto-restart loop:
```bash
while true; do "$script"; sleep 0.5; done
```
If the script exits, it is restarted after 500ms. Stderr is redirected to
the daemon's log. Scripts that use `mmsg watch` (long-lived subscriptions)
should not normally exit; polling scripts that crash will be restarted.

## Debounce System

Uses trailing-edge debounce with per-type overrides:

| Config | wayshell.conf value | Script default | Description |
|---|---|---|---|
| `zone_buffer` | `30` | `10` | Pixels from screen edge defining a zone |
| `on_delay` | `300` ms | `100` ms | Default ON debounce |
| `off_delay` | `500` ms | `100` ms | Default OFF debounce |
| `zone_on_delay` | `300` ms | `on_delay` | Zone ON override |
| `zone_off_delay` | `1500` ms | `off_delay` | Zone OFF override (slow to avoid flicker) |
| `layout_on_delay` | `200` ms | `on_delay` | Layout ON override |
| `layout_off_delay` | `0` ms | `off_delay` | Layout OFF override (instant) |
| `focused_on_delay` | `50` ms | `on_delay` | Focused ON override (fast) |
| `focused_off_delay` | `500` ms | `off_delay` | Focused OFF override |

### State transitions

```
disabled  ──[enter]──→  pending_on  ──[on_delay]──→  enabled
enabled   ──[exit]───→  pending_off ──[off_delay]──→  disabled
pending_off ──[re-enter]──→ enabled  (cancel pending OFF)
```

The `pending_off` cancellation prevents flicker when the cursor briefly
leaves and re-enters a zone within the OFF delay window.

## Module State Machine

Internal state is stored in associative arrays:

```bash
declare -A MODULE_STATES      # name → disabled|pending_on|enabled|pending_off
declare -A MODULE_ENTER_TS    # name → timestamp when enter was detected
declare -A MODULE_EXIT_TS     # name → timestamp when exit was detected
```

## Adding a New Module

### 1. Write the event source script

Place it in `modules/`. It must output JSON lines conforming to the
event source protocol for its type (zone/layout/focused).

Example — a simple zone source:
```bash
#!/bin/bash
# modules/myzone.sh
while true; do
    cursor=$(mmsg get cursorpos)
    x=$(jq -r '.x' <<< "$cursor")
    y=$(jq -r '.y' <<< "$cursor")
    mon=$(jq -r '.monitor' <<< "$cursor")
    # Custom zone detection logic...
    echo '{"x":'"$x"',"y":'"$y"',"monitor":"'"$mon"'"}'
    sleep 0.1
done
```

### 2. Register in wayshell.modules

```
my_zone|echo "entered"|echo "exited"|zone|100,100,300,300
my_layout|~/.config/snapsos/wayshell/configs/my-on.sh|~/.config/snapsos/wayshell/configs/my-off.sh|layout|M
my_focused|notify-send "firefox focused"|notify-send "firefox unfocused"|focused|firefox
```

Lines starting with `#` are ignored.

### 3. Restart the daemon

```bash
pkill wayshell.sh
# or use the mango keybind for config reload
```

### 4. (Optional) Create config scripts

For complex ON/OFF logic, place scripts in `configs/` and reference them
in the module definition.

### 5. (Optional) Add Waybar config

If the module launches a Waybar instance, add JSON/CSS configs in `configs/`
and source the `colors.css` theme.

## Waybar Config Integration

Config scripts in `configs/` follow these conventions:

- **JSON files** define Waybar bar layouts with `include` directives for
  module lists
- **CSS files** `@import` `colors.css` for matugen theming
- **Module list files** (`*-modules`) define individual custom modules with
  `exec`, `on-click`, `signal`, and formatting
- **Signal numbers** are used for reactive updates: SIGRTMIN+1 for elevated,
  SIGRTMIN+2 for focused, SIGRTMIN+3 for FPS

Config scripts that populate Waybar modules use this JSON output format:
```json
{"text":"label","tooltip":"description","class":"css-class","alt":"0"}
```

## Pin System (Bottom Bar)

The bottom bar has a pin mechanism to prevent it from hiding:

1. Zone ON handler sets `$CACHE_DIR/bottom_<module>_visible` to `1`
2. Zone OFF handler checks `$CACHE_DIR/bottom_<module>_pinned` — if `1`, skips hide
3. The bar is killed only when no `bottom_*_visible` file contains `1`
4. Pin toggle script (`*-pin.sh`) flips the pin file and signals SIGRTMIN+N

## Logging

All daemon output goes to `/tmp/wayshell_daemon.log`. Event source stderr
also appears there. Modules log their lifecycle with `ON name` / `OFF name`
lines.

## Matugen Template

The `colors.css` template uses Jinja2-style matugen syntax:

```
<* for name, value in colors *>
    @define-color {{name}} {{value.default.hex}};
<* endfor *>
```

This is processed by matugen to produce `configs/colors.css`, providing
dynamic Material You theming to all Waybar bars.
