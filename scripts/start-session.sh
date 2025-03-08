#!/bin/bash

SESSION="OneThreeVert"

ALREADYEXITS=$(tmux list-sessions | grep $SESSION)

if [ "$ALREADYEXITS" = "" ]
then
  tmux new-session -d -s $SESSION

  # Create and name main window
  tmux rename-window -t 1 'Nvim'

  # Create and name side windows
  tmux split-window
  tmux split-window
  tmux split-window
  # tmux new-window -t $SESSION:2 -n 'term 1'
  # tmux new-window -t $SESSION:3 -n 'term 2'
  # tmux new-window -t $SESSION:4 -n 'term 3'

  # Set layout
  tmux select-layout main-vertical

  # Set up panes
  tmux send-keys -t $SESSION:1.1 "nvim" C-m
fi

tmux attach-session -t $SESSION:1
