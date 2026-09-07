# Developer Guide

This section covers the internal architecture of SDG-OS components, intended for developers who want to understand, extend, or contribute to the project.

## Contents

- [Project Structure](project-structure.md) — full codebase map
- [Glyphs Internals](glyphs.md) — stroke matching algorithm, geometry pipeline, adding gestures
- [Vox Internals](vox.md) — audio capture, Whisper/Vosk recognition, command tree matching
- [Wayshell Internals](wayshell.md) — module API, event sources, debounce system
- [Contributing](contributing.md) — how to contribute

## Architecture Overview

SDG-OS has two main Python packages (Glyphs and Vox) and several Bash-based systems:

```
Python packages:
  snapsos/glyphs/glyphs/    13 modules — GTK overlay + stroke matching
  snapsos/vox/vox/          14 modules — GStreamer audio + speech recognition

Bash systems:
  snapsos/wayshell/         Event daemon with modular sources
  snapsos/monocle/          Per-monitor Waybar launchers
  snapsos/tuis/             fzf-based TUI utilities
  snapsos/help/             Help topic system
  snapsos/tips/             Random tip system
```
