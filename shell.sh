#!/usr/bin/env bash

ID=$(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | awk '{print $5}')
NAME=$(xprop -id $ID | grep -m 1 WM_NAME | cut -d '"' -f 2)

if [[ $NAME == *"IntelliJ IDEA"* ]]
then
    FILEPATH=$(echo $NAME | cut -d "[" -f 2 | cut -d "]" -f 1)
    FILEPATH=${FILEPATH/"~"/"/home/cengels"}
    gnome-terminal --working-directory=$FILEPATH
else
    i3-sensible-terminal
fi
