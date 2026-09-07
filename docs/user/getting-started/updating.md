# Updating

## Quick Update

```bash
cd ~/SNAPS-OS
git pull
./update.sh
```

The update script will:

1. Reinstall system packages via `pacman -Syu` (same list as install, minus python-gobject, python-cairo, wtype)
2. Reinstall AUR packages via `yay -S`
3. Prompt for each component refresh (except snapsos which is unconditional):
   - **Mango config** — prompted
   - **DMS config** — prompted
   - **Ghostty config** — prompted
   - **~/.zshrc** — prompted
   - **~/.p10k.zsh** — prompted separately from zshrc
4. **Unconditionally rebuild** `~/.config/snapsos/` (no prompt — always replaced)
5. Fix permissions on `~/.config/snapsos/`

Note: Matugen templates are NOT refreshed by the update script.

## ⚠️ Important Notes

- The **snapsos scripts directory is always replaced** — any custom scripts you added will be lost. Back them up first.
- Other components prompt individually — you can accept or skip each one.
- Backups go to `*-old-$RAND` (same random suffix per run).
- To inspect what changed between versions, use `git log` or browse the repository on GitHub.

## Manual Update

After `git pull`, you can manually copy specific configs:

```bash
# Copy only scripts (keeping your WM/DMS configs intact)
cp -r SNAPS-OS/snapsos ~/.config
chmod -R a+x ~/.config/snapsos
```

Or cherry-pick individual files from the repository as needed.
