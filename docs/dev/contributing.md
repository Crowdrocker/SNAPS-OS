# Contributing

## How to Contribute

SDG-OS is a personal project, but contributions and suggestions are welcome.

### Reporting Issues

Open an issue on the [GitHub repository](https://github.com/CrowdrockerSNAPS-OS/issues).

### Feature Requests

Open an issue describing the feature. If it's a new integration or tool, include:

- What problem it solves
- How it would integrate with existing components
- Dependencies required

### Pull Requests

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test that the install scripts still work
5. Submit a PR with a clear description

## Coding Conventions

### Bash Scripts

- Use `#!/bin/bash` shebang
- Prefer `fzf` for interactive selection
- Use `bat` for file previews where applicable
- Use `jq` for JSON parsing
- Follow existing style (see `snapsos/tuis/` for examples)

### Python (Glyphs / Vox)

- Python 3.10+ compatible
- Use `argparse` for CLI
- Use GTK 3 / PyGObject for GUI components (both Glyphs and Vox use GTK 3)
- Follow existing module structure
- Use type hints and dataclasses

## Future Integrations

See [`TODO.md`](../../TODO.md) in the repository root for planned integrations:

- [msnap](https://github.com/xtheeq/msnap) — screenshot tool
- [mango-ext](https://github.com/ernestoCruz05/mango-ext) — touch support
- [mango-layout-switcher](https://github.com/atheeq-rhxn/mango-layout-switcher) — layout switching
- [mdisplay](https://github.com/ernestoCruz05/mdisplay) — display management
- [mlint](https://github.com/ernestoCruz05/mlint) — config error checker
