# Adding Custom Scripts

SNAPS-OS scripts are symlinked to `/usr/bin/` so they can be invoked from anywhere.

## Adding a New Script

1. Create your script in `~/.config/snapsos/` (or any subdirectory):

   ```bash
   touch ~/.config/snapsos/myscript.sh
   chmod a+x ~/.config/snapsos/myscript.sh
   ```

2. Write your script:

   ```bash
   #!/bin/bash
   echo "Hello from my custom script!"
   ```

3. Symlink to `/usr/bin/`:

   ```bash
   sudo ln -sf ~/.config/snapsos/myscript.sh /usr/bin/myscript
   ```

Now you can run `myscript` from anywhere.

## Binding a Script to a Key

Add to `~/.config/mango/binds.conf`:

```
bind=SUPER+CTRL+M,spawn_shell,myscript
```

Then reload:

```bash
mmsg dispatch reload_config
```

## Editing Existing Scripts

Scripts are in `~/.config/snapsos/`. Edit them directly:

```bash
micro ~/.config/snapsos/mango-config.sh
```

To change the editor used by the mango config editor (`mangoconf-editor`), edit this line in `~/.config/snapsos/mango-config.sh`:

```bash
app=micro   # Change to vim, nano, code, etc.
```

## Removing a Script

```bash
sudo rm /usr/bin/myscript
rm ~/.config/snapsos/myscript.sh
```
