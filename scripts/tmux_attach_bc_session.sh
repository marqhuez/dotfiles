#!/bin/bash

# Define session name and project directory
SESSION_NAME="bc"
PROJECT_DIR="~/work/bc/brokerchooser.com"

# Check if the session already exists
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Create a new tmux session
    tmux new-session -d -s $SESSION_NAME -n vim

    # Window 1: Launch vim in the project directory
    tmux send-keys -t $SESSION_NAME "cd $PROJECT_DIR && vim" C-m

    # Window 2: Create and split panes
    tmux new-window -t $SESSION_NAME -n dev -c $PROJECT_DIR
    tmux split-window -h -c $PROJECT_DIR     # Split horizontally
    tmux split-window -v -c $PROJECT_DIR     # Split bottom-left
    tmux select-pane -t 1                    # Focus top-left pane
    tmux split-window -v -c $PROJECT_DIR     # Split top-left vertically

	tmux send-keys -t $SESSION_NAME:2.1 "cd $PROJECT_DIR && clear" C-m
    tmux send-keys -t $SESSION_NAME:2.2 "cd $PROJECT_DIR && clear" C-m
    tmux send-keys -t $SESSION_NAME:2.3 "cd $PROJECT_DIR && clear" C-m
	tmux send-keys -t $SESSION_NAME:2.4 "cd $PROJECT_DIR && npm run dev" C-m

    tmux select-pane -t 1

    # Return to the first window (vim)
    tmux select-window -t $SESSION_NAME:1
fi

# Attach to the session
tmux attach -t $SESSION_NAME
