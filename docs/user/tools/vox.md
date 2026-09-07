# Vox — Voice Command System

**Command**: `vox daemon` / `vox config`  
**Location**: `~/.config/snapsos/vox/`  
**Symlinked to**: `/usr/bin/vox` (via `vox.sh` wrapper)

Vox is a wake-word activated, offline voice-to-command system. It listens for a wake word, transcribes speech using Whisper or Vosk, and executes matched commands from a configurable command tree.

## Commands

| Command | Description |
|---|---|
| `vox daemon` | Start the voice daemon (listens in background) |
| `vox daemon --headless` | Start daemon without the GTK overlay HUD |
| `vox config` | Open the GTK config editor GUI |
| `vox --config <path>` | Use a custom config file path |

## Daemon

`vox daemon` starts the background listening process:

1. Captures audio via GStreamer pipeline (pipewire/pulse source)
2. Detects wake word
3. Records speech until silence
4. Transcribes via Whisper or Vosk
5. Matches against the command tree
6. Executes the corresponding action

The daemon shows a GTK 3 overlay HUD with transcription. Use `--headless` to suppress it.

## Config Editor

`vox config` opens a GTK GUI for editing the voice command tree with a visual flowchart.

## Configuration

File: `~/.config/snapsos/vox/config.json`

Top-level keys:

| Key | Description |
|---|---|
| `terminal` | Terminal command for terminal-mode exec (e.g., `ghostty -e`) |
| `exec_prefix` | Prefix for shell command execution |
| `prefixes` | Word-based command prefixes (e.g., `administrator` → prepends `sudo`; `silent` → prepends `setsid -w`) |
| `suffixes` | Word-based command suffixes (e.g., `background` → appends `&`; `detach` → appends `&>/dev/null &`) |
| `immediate_triggers` | Commands triggered by single words (e.g., `cancel`) |
| `tree.nodes` | Command tree node graph |

### Default Command Tree

Default wake word: **"system command"** (aliases: `cmd`, `computer`, `i cast`, `highcast`)

Root level branches:
- **launch** — `browser`, `firefox`, `chromium`, `package` (unipkg), `terminal`
- **open** — same as launch: `browser`, `firefox`, `chromium`, `package`, `terminal`
- **quit** — `browser`, `firefox`, `chromium`
- **clipboard** — `copy`, `paste`
- **volume** — `up`, `down`, `mute`
- **search for** — web search via browser (Google)
- **type** — type text via `ydotool type`
- **run** — `system` update/upgrade
- **output** — type text via `ydotool type` (same as type)
- **dictate** — type text via `ydotool type` (same as type)
- **execute** — `system` (update/upgrade), `order` (play imperial march)
- **full** — `system` update/upgrade
- **fool** — `system` update/upgrade

## Voice Models

Models are stored in `~/.config/snapsos/vox/models/`:
- `ggml-medium.en.bin` — Whisper medium English model (default)
- `ggml-base.en.bin` — Whisper base English model
- `vosk-model-en-us-0.22-lgraph/` — Vosk model
- `vosk-model-small-en-us-0.15/` — Vosk small model

Run `~/.config/snapsos/vox/install.sh` to download the Whisper medium model.
