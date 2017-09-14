# intellij-terminal-launcher
Launches a terminal based on the directory of the currently focused IntelliJ window.

## How it works
This terminal grabs the title of the currently focused IntelliJ window and extracts the directory path. Therefore, if your IntelliJ windows for some reason do not include the directory path in them, this script will not work.

## Setup
This script is, by default, tailored toward i3 users using bash and the default gnome-terminal. If your setup differs, you may have to customize the script.

* `#!/usr/bin/env bash` initializes the script. If you use a different shell (like zsh), replace `bash` with its name.
* `ID=$(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}')` grabs the ID of the currently focused window. It's specifically made to work for i3, due to i3's non-standard window structure. If you use a different window manager, you may have to do your own research on how to grab the currently focused window.
* Any lines including `gnome-terminal` launch a terminal. If you'd like to use a different terminal, you need to replace this line and find the appropriate parameter to navigate to a specific directory on launch.
