# Glyphs — Developer Documentation

**Package**: `~/.config/snapsos/glyphs/glyphs/` (Python package, 13 modules)

## Architecture

```
glyphs-cli.py           CLI entry point (argparse → GlyphApp)
    │
    └── glyphs/
        ├── __init__.py         Public API exports
        ├── app.py              GlyphApp orchestrator
        ├── config.py           Config loading/saving
        ├── models.py           StrokeGlyph data model
        ├── storage.py          JSON persistence (glyphs-data/)
        ├── geometry.py         Stroke matching pipeline (RDP + resample + distance)
        ├── grid.py             Grid definitions for snapped recording
        ├── input.py            Input event handling (GTK 3)
        ├── widgets.py          GTK widgets (GlyphCard)
        ├── normal.py           Normal drawing overlay
        ├── record_grid.py      Grid-snapped recording overlay
        ├── record_freehand.py  Freehand recording overlay
        └── dictionary.py       Dictionary browser window
```

## Stroke Matching Pipeline (geometry.py)

### 1. RDP Simplification

Ramer-Douglas-Peucker algorithm reduces raw input points to a simplified polyline, removing redundant points while preserving shape.

### 2. Resampling

The simplified stroke is uniformly resampled to 32 evenly-spaced points using cumulative chord-length parameterisation (equal arc-length spacing). This normalises strokes regardless of drawing speed.

### 3. Normalisation

The resampled stroke is scaled so the larger dimension fits in [0,1], then centred at the origin.

### 4. Rotation- and Shift-Invariant Distance

`stroke_distance()` compares two strokes by trying:
- **12 equispaced rotations** (0° to 165° in 15° steps)
- **n cyclic shifts** (all possible start points)

Returns the minimum average pointwise Euclidean distance across all rotations and shifts.

### 5. Best Match Selection

The glyph template with the lowest distance is selected. If the distance exceeds `MATCH_THRESHOLD` (0.12), no action is taken.

## Data Model (models.py)

```python
class StrokeGlyph:
    def __init__(self, stroke, string=None, name=None):
        self.stroke = stroke    # list of (x, y) tuples — raw screen-space points
        self.string = string    # output string (command to execute)
        self.name = name        # human-readable name

    @property
    def display_text(self):
        return self.string if self.string else "?"
```

## Persistence Format (storage.py)

Glyphs are stored as individual JSON files in `glyphs-data/`. Each file contains:

```json
{
    "name": "firefox",
    "string": "firefox",
    "templates": [
        { "pts": [[x, y], [x, y], ...] },
        { "pts": [[x, y], [x, y], ...] }
    ]
}
```

- `name` — glyph identifier (used as filename: `{name}.json`)
- `string` — output command
- `templates` — array of stroke templates (multiple = rotation/scale variants). Each template has a `pts` array of (x, y) coordinate pairs.

## Recording Dialog Tokens

When recording a glyph, the dialog accepts these special tokens:

| Token | Behavior |
|---|---|
| Plain text | Typed via `wtype` in TYPE mode; executed via `exec_prefix` in EXEC mode |
| `__mode_exec__` | Switches to EXEC mode — subsequent plain-text glyphs are executed as shell commands via `exec_prefix` |
| `__mode_term_exec__` | Switches to TERM-EXEC mode — subsequent commands run in a terminal via `term_exec`, optionally prefixed with `exec_prefix` |
| `__complete_enter__` | Sends Enter keypress after executing the accumulated glyphs |

## Configuration (config.json)

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

## Overlay System

All overlays use **GTK 3** (not GTK 4) via PyGObject with Cairo for rendering.

| Module | Mode | Description |
|---|---|---|
| `normal.py` | Drawing | Transparent GTK 3 overlay, captures input, matches and executes |
| `record_grid.py` | Record (grid) | Shows grid overlay, snaps strokes to grid lines |
| `record_freehand.py` | Record (freehand) | Shows freehand canvas, saves raw strokes |

## Dependencies

- Python 3.10+
- GTK 3 / PyGObject (`gi.require_version("Gtk", "3.0")`)
- Cairo
- `math` (standard library)
