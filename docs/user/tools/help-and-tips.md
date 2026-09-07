# Help & Tips System

SNAPS-OS includes a built-in help system and tips viewer.

## Help System

**Location**: `~/.config/snapsos/help/`

### help.sh

**Command**: `SUPER+SHIFT+H` or `helptui` alias.

Launches fzf with 25 markdown topics:

```
001 SNAPS-OS included software
002 SNAPS-OS included utility scripts
003 SNAPS-OS important keybinds
004 using SNAPS-OS functions
101 accessing the settings menu
102 overview of other menus
103 window management
104 installing applications
105 layouts
201 basic navigation in the terminal
202 basic file modification in the terminal
203 basic terminal utilities
204 text modification and filtering
205 terminal piping
206 file permissions
207 additional useful terminal functions
301 customizing DMS
401 customizing mango - layouts
402 customizing mango - binds
403 customizing mango - decoration
404 customizing mango - autostart
405 customizing mango - monitors
501 scripting basics
502 flow control
```

### cmd-help.sh

**Command**: `cmdhelp` (symlink), `tldrtui` alias, or `SUPER+H`.

TLDR-style command help viewer:
- Lists common commands with `tldr` preview
- Press `ENTER` on any command to open its `man` page

### Reference Lists

Reference files in `~/.config/snapsos/help/`:
- `DMSipc.list` — Full DMS IPC command reference
- `mangoipc.list` — MangoWM IPC commands
- `mangodispatchers.list` — MangoWM dispatchers
- `references.list` — External documentation URLs
- `cmds.list` — Command descriptions

## Tips System

**Location**: `~/.config/snapsos/tips/`

- A random tip is shown when Ghostty opens
- `tipme` — show a random tip in the terminal
- `alltips` (zsh alias) — browse all tips via fzf
- `cowtip` — random tip via cowsay + lolcat
- `SUPER+0` — show a notification popup with a random tip
