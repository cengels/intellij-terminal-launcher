# intellij-terminal-launcher
Launches a terminal based on the directory of the currently focused IntelliJ window.

## How it works
This terminal grabs the title of the currently focused IntelliJ window and extracts the directory path. Therefore, if your IntelliJ windows for some reason do not include the directory path in them, this script will not work.

If the script cannot find a focused IntelliJ window, it will automatically launch a new terminal in your home directory. Therefore, this script can serve as a complete replacement for your standard terminal launch shortcut.

Due to the fact this script grabs the focused window, you cannot run this script inside a terminal. Instead you'll need to define a shortcut (see below).

## Installation
1. Download `shell.sh` or copy its contents and paste them into a new `.sh` file.
2. Place that file in `/usr/local/bin` (or another directory of your choice).
3. Enter your window manager's config file.
4. Add a new line, defining a shortcut key that points to the file you just created. If you placed the script in `/usr/local/bin`, you only need to specify the script's name, not the full path.  
For instance, in i3 that config line could look like this: `bindsym $mod+Return exec shell.sh`

## Setup
This script is, by default, tailored toward i3 users using bash and the default gnome-terminal. If your setup differs, you may have to customize the script.

* `#!/usr/bin/env bash` initializes the script. If you use a different shell (like zsh), replace `bash` with its name.
* `ID=$(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}')` grabs the ID of the currently focused window. It's specifically made to work for i3, due to i3's non-standard window structure. If you use a different window manager, you may have to do your own research on how to grab the currently focused window.
* Any lines including `gnome-terminal` launch a terminal. If you'd like to use a different terminal, you need to replace this line and find the appropriate parameter to navigate to a specific directory on launch.
