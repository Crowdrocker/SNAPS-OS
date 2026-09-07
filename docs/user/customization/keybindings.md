# Customizing Keybindings

Keybindings are defined in `~/.config/mango/binds.conf`. The format is:

```
bind=<MODIFIER+KEY>,<dispatcher>,<params>
```

## Examples

```
bind=SUPER,RETURN,spawn_shell,ghostty
bind=SUPER,Q,killclient
bind=SUPER+SHIFT,Q,quit
```

Note: Use `spawn_shell` for shell commands, not `exec`.

## Adding a New Binding

```bash
echo "bind=SUPER+CTRL+T,spawn_shell,ghostty" >> ~/.config/mango/binds.conf
mmsg dispatch reload_config
```

## Modifier Keys

| Key | Meaning |
|---|---|
| `SUPER` | Windows/Command key |
| `ALT` | Alt key |
| `CTRL` / `Ctrl` | Control key |
| `SHIFT` | Shift key |
| `NONE` | No modifier (press key alone) |

## Dispatchers

Common dispatchers (from `~/.config/snapsos/help/mangodispatchers.list`):

| Dispatcher | Description |
|---|---|
| `spawn` | Run a command (no shell) |
| `spawn_shell` | Run a shell command |
| `killclient` | Close focused window |
| `togglefullscreen` | Toggle fullscreen |
| `togglefloating` | Toggle floating |
| `togglefakefullscreen` | Fake fullscreen mode |
| `focusdir` | Focus window by direction |
| `focusstack` | Focus next/previous in stack |
| `exchange_client` | Swap windows |
| `movetotag` | Move window to tag |
| `view` | Switch to tag |
| `tag` | Move window and switch to tag |
| `toggleview` | Toggle tag visibility |
| `setlayout` | Set layout |
| `reload_config` | Reload config |
| `quit` | Exit mango |

For the full list, see `~/.config/snapsos/help/mangodispatchers.list` or open the documentation TUI (`SUPER+SHIFT+M`).

## Disabling Default Bindings

Comment out lines with `#`:

```
# bind=SUPER,RETURN,spawn_shell,ghostty
```

Then reload:

```bash
mmsg dispatch reload_config
```

## Mouse Bindings

```
mousebind=SUPER,btn_left,moveresize,curmove
mousebind=SUPER,btn_right,moveresize,curresize
mousebind=SUPER,btn_middle,togglemaximizescreen,0
```
