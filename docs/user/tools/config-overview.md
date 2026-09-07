# Config Overview — Mango Config Browser

**Location**: `~/.config/snapsos/config-overview/`

A set of tools for browsing, checking, and understanding mangoWM configuration files.

## Files

| File | Purpose |
|---|---|
| `menu.sh` | **Command**: `mangoconf-viewer` — TUI to select and view config files |
| `browser.sh` | Config file browser with per-line details and documentation links |
| `checker.sh` | Config option explainer — looks up key descriptions from `options.list` |
| `options.list` | Curated list of mangoWM config options with examples and doc links |

## menu.sh (mangoconf-viewer)

Bound to `SUPER+ALT+M`. Opens an fzf interface listing all files in `~/.config/mango/`:

- Left panel: file list with preview
- Select a file → opens in interactive viewer
- Press `ALT+B` to open documentation in Firefox

## options.list

Format: `key | example | description | doc_link | category`

Each entry contains:
- Config key name
- Example usage
- Description of what it does
- Link to mangoWM documentation
- Category tag (autostart, basics, etc.)

## checker.sh

Scans config options and prints explanatory text for each key by looking it up in `options.list`. It describes what each config category does rather than validating syntax.

## browser.sh

A line-by-line config browser with documentation links for each directive.
