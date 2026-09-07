# Zsh Configuration

SNAPS-OS ships a customized Zsh setup with Oh-My-Zsh, Powerlevel10k, and several productivity plugins.

## Files

| File | Location | Purpose |
|---|---|---|
| `~/.zshrc` | User home | Main Zsh config (copied from `snapsos/zshrc`) |
| `~/.p10k.zsh` | User home | Powerlevel10k theme config |
| `~/.config/snapsos/zshconfig.zsh` | Config dir | Aliases, suffix aliases, functions, zoxide, fzf |

## Prompt: Powerlevel10k

The Powerlevel10k prompt is pre-configured with a clean layout showing:
- Current directory (truncated)
- Git branch and status
- Command execution time
- Exit code
- Background jobs
- Distro icon (Arch by default)

## Plugins

Oh-My-Zsh plugins loaded:
- `git` — git aliases and completion
- `fzf` — fuzzy finder integration
- `extract` — `x` function to extract any archive

External plugins:
- `zsh-syntax-highlighting` — command syntax coloring
- `zsh-autosuggestions` — command history suggestions
- `zsh-history-substring-search` — incremental history search
- `pkgfile` command-not-found handler

## Tool Replacements

| Tool | Replaces | Description |
|---|---|---|
| **eza** | `ls` | Modern `ls` with colors, icons, tree view |
| **zoxide** | `cd` | Smart directory jumping. `z <fragment>` jumps to best match. Initialized with `--cmd cd` so `cd` itself uses zoxide |
| **fzf** | `find` | Fuzzy file finding with `bat` preview |
| **bat** | `cat` | Syntax-highlighted file preview (used by fzf) |

## Key Aliases

### File listing
- `ls` → `eza -al --color=always --group-directories-first --icons`
- `la` → `eza -a` (all files)
- `ll` → `eza -l` (long format)
- `lt` → `eza -aT --level=4` (tree)
- `l.` → show only dotfiles

### Navigation
- `..` / `...` / `....` / `.....` / `......` — go up directories

### Tools
- `find` → `fzf --layout=reverse --preview='bat {}'`
- `microfind <pattern>` — fuzzy-find files, open selected in micro
- `update` → `sudo pacman -Syu`
- `tipme` — show a random tip
- `alltips` — browse all tips via fzf
- `cowtip` — random tip via cowsay + lolcat
- `pacgui` — open pacman package installer TUI
- `aurgui` — open AUR package installer TUI
- `git-projects` — open project browser TUI
- `fetch` / `fetchconf` — fastfetch wrapper
- `mangoconf` — open mango config editor
- `cmdhist` — search and reuse command history
- `plz` — re-run last command with sudo

## Suffix Aliases

Type a filename as a command to open it in the associated program:

| Extension | Program |
|---|---|
| `.json`, `.yaml`, `.yml` | micro |
| `.md` | micro |
| `.toml` | micro |
| `.conf` | micro |
| `.txt` | micro |
| `.css` | micro |
| `.html` | micro |
| `.nix` | micro |
| `.png`, `.jpg`, `.jpeg`, `.webp` | satty |

## History

- Command history is searchable with `CTRL+R`
- `history-substring-search` provides incremental history search (type start of command, press UP)
