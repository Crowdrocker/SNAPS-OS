# Vox — Developer Documentation

**Package**: `~/.config/snapsos/vox/vox/` (Python package)

## Architecture

```
vox.sh                  Shell wrapper (adds vox/ to sys.path)
  │
  └── vox/
      ├── __init__.py           Version info
      ├── __main__.py           Module entry point
      ├── cli.py                CLI parser (daemon / config subcommands)
      ├── daemon.py             Main daemon loop (GLib main loop)
      ├── config_manager.py     Config loading with dataclasses
      ├── audio_capture.py      GStreamer audio capture
      ├── recognizer.py         Vosk-based speech-to-text with wake-word
      ├── whisper_recognizer.py Whisper.cpp server-based recognition
      ├── command_tree.py       Tree-based voice command matching
      ├── executor.py           Command execution
      ├── overlay.py            GTK 3 overlay HUD
      ├── config_ui.py          GTK 3 config editor GUI
      ├── models.py             GraphNode data model
      └── flowchart_view.py     Visual command tree flowchart
```

## Daemon Lifecycle (daemon.py)

1. **Initialize** — load config, set up recognizer, build command tree
2. **Start audio capture** — GStreamer pipeline captures microphone input
3. **Wake word detection** — continuously monitor audio for wake word
4. **Command recording** — after wake word, record speech until silence
5. **Transcription** — send audio to Whisper or Vosk for transcription
6. **Command matching** — traverse command tree with transcribed text
7. **Execution** — run matched command via executor
8. **Loop** — return to wake word detection

All runs on a GLib main loop.

## Audio Capture (audio_capture.py)

GStreamer pipeline:

```
pipewiresrc → audioconvert → audioresample → capsfilter(16kHz S16LE mono) → appsink
```

- Tries `pipewiresrc` first, falls back to `pulsesrc`
- Output: 16 kHz, S16LE, mono PCM samples
- Each buffer triggers the `on_audio` callback

## Recognizers

### Vosk Recognizer (recognizer.py)

A concrete class using the `vosk` library with:
- Wake-word detection via keyword spotting
- Auto-downloads model from alphacephei.com on first use
- Methods: `feed()`, `finish()`, `partial_result()`

### Whisper Recognizer (whisper_recognizer.py)

Communicates with `whisper.cpp` server via HTTP (`urllib.request.urlopen`):
- Sends PCM audio chunks to the server
- Receives transcribed text
- Higher accuracy but requires external whisper.cpp server

Note: There is no shared abstract base class between the two recognizers — they have completely different APIs.

## Command Tree Model (models.py)

```python
@dataclass
class GraphNode:
    type: str           # "root", "branch", "exec", "shell_exec", "type"
    trigger: str        # The word(s) to match for this node
    wake_word: str      # Wake word phrase (root nodes only)
    aliases: list[str]  # Alternative wake words (root nodes only)
    command: str        # Shell command for action types. {text} is
                        # substituted with captured utterance text.
    text_capture: bool  # If True, capture remaining utterance tokens
                        # and substitute into {text}
    connections: list[str]  # List of child node names (branch/root)
    pos_x: float | None # Canvas position for flowchart
    pos_y: float | None
```

## Matching Algorithm (command_tree.py)

1. Split transcribed text into tokens
2. Start at root nodes, check wake word + aliases
3. Walk child nodes by matching utterance tokens against node triggers
4. If an action node (exec/shell_exec/type) is reached, execute it
5. If `text_capture` is set on a node, remaining utterance tokens are captured and substituted into `{text}` in the command

## Executor (executor.py)

- **Exec nodes**: run a predefined command
- **Shell exec nodes**: execute shell commands via subprocess
- **Type nodes**: simulate keyboard typing via `ydotool type`

## Configuration Format (config.json)

```json
{
    "terminal": "ghostty -e",
    "exec_prefix": "mmsg dispatch spawn_shell,",
    "prefixes": [{ "words": ["administrator"], "prepend": "sudo", "append": "" }],
    "suffixes": [{ "words": ["background"], "prepend": "", "append": "&" }],
    "immediate_triggers": [{ "word": "cancel", "type": "exec", "command": "true" }],
    "tree": {
        "nodes": {
            "default": {
                "type": "root",
                "wake_word": "system command",
                "aliases": ["cmd", "computer", "i cast", "highcast"],
                "connections": ["launch", "open", "quit", ...]
            },
            "launch": {
                "type": "branch",
                "trigger": "launch",
                "connections": ["browser_l", "terminal_l", ...]
            }
        }
    }
}
```

Nodes are keyed by ID string in a map (not an array). Each node has a `type`, `trigger`, and optional `connections` (for branches) or `command` (for actions).

## Config Editor

`config_ui.py` provides a GTK 3 GUI for editing the command tree with a visual flowchart in `flowchart_view.py`.

## Dependencies

- Python 3.10+
- GStreamer + Python bindings (`gi.require_version("Gst", "1.0")`)
- GTK 3 / PyGObject (`gi.require_version("Gtk", "3.0")`)
- `vosk` (for Vosk backend)
- `whisper.cpp` (external, for Whisper backend)
- `setuptools` (build backend, defined in pyproject.toml)
