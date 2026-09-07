# Glyphs — Pen Gesture System

**Command**: `glyphs`  
**Location**: `~/.config/snapsos/glyphs/`  
**Symlinked to**: `/usr/bin/glyphs` (symlink to `glyphs-cli.py`)

Glyphs is a pen-based gesture input system that lets you draw strokes on screen to trigger commands. It uses a transparent GTK 3 overlay to capture input and matches strokes against a dictionary of recorded gestures.

## Modes

| Command | Mode | Description |
|---|---|---|
| `glyphs` | Normal | Transparent overlay — draw a gesture, matched command executes |
| `glyphs --record` | Record (grid) | Record new gestures snapped to a grid |
| `glyphs --record-freehand` | Record (freehand) | Record new gestures freehand |
| `glyphs --dictionary` | Dictionary | Browse saved gestures (read-only grid) |

## Normal Mode

When launched (bound to `SUPER+G`), a fullscreen transparent overlay appears. Draw a stroke with your pen or finger. When you lift the input, the stroke is matched against the dictionary and the best-matching command executes.

## Recording Gestures

### Grid-Snapped

`glyphs --record` opens a grid overlay. Draw strokes that snap to grid lines. After recording, a dialog lets you:

- Enter a name for the gesture
- Set the output action (command to run)
  - Plain text: typed via `wtype` in TYPE mode; executed as shell command via `exec_prefix` in EXEC mode
  - `__mode_exec__`: draw this glyph to switch to EXEC mode (subsequent plain-text glyphs are executed as shell commands)
  - `__mode_term_exec__`: draw this glyph to switch to TERM-EXEC mode (subsequent commands run in a terminal via `term_exec`)
  - `__complete_enter__`: draw this glyph to send Enter key after executing the accumulated glyphs

### Freehand

`glyphs --record-freehand` works the same way but without grid snapping.

## Dictionary Browser

`glyphs --dictionary` opens a GTK window with a scrollable grid of glyph cards showing saved gestures and their names.

## Configuration

File: `~/.config/snapsos/glyphs/config.json`

```json
{
  "recording": { "sections": 4 },
  "appearance": {
    "ink_width": 3.0,
    "background_rgba": [0.0, 0.0, 0.0, 0.06],
    "dictionary_grid_cols": 8,
    "carousel": { "enabled": true, "height": 70 },
    "exec_prefix": "mmsg dispatch spawn_shell,",
    "term_exec": ["ghostty", "-e"]
  }
}
```

| Key | Description |
|---|---|
| `recording.sections` | Number of organizational section tags |
| `appearance.ink_width` | Stroke rendering width (pixels) |
| `appearance.background_rgba` | Overlay background color |
| `appearance.dictionary_grid_cols` | Columns in dictionary view |
| `appearance.carousel.enabled` | Enable carousel mode |
| `appearance.exec_prefix` | Prefix for command execution |
| `appearance.term_exec` | Terminal command for terminal-mode actions |
