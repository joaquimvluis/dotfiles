#!/bin/bash

# To chain tmux commands must escape semicolon, like ';', otherwise shell
# interprets it has a shell command

# 'send' is alias for 'send-keys'

SESSION_NAME="platform"
CHANGE_DIR="pfb && clear"

# check if session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME already exists, attaching to it."
    tmux attach-session -t $SESSION_NAME 
else
    # start tmux in detached mode and rename it
    tmux new -s $SESSION_NAME -d
    tmux rename-window main ';' send $CHANGE_DIR C-m
    # create new windows and rename
    tmux new-window -t $SESSION_NAME ';' rename-window pytest ';' send $CHANGE_DIR C-m
    tmux new-window -t $SESSION_NAME ';' rename-window shell ';' send $CHANGE_DIR C-m
    tmux select-window -t 1
fi

SESSION_NAME=audio
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME already exists, attaching to it."
    tmux attach-session -t $SESSION_NAME 
else
    tmux new -s $SESSION_NAME ';' send-keys "yt" C-m
fi
