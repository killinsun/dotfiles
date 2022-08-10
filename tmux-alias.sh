#!/bin/sh

tmux split-window -h
tmux split-window -v
tmux select-pane -t 1
tmux split-window -v

if [ -e ~/src/github.com/WOVNio/equalizer ]; then
  tmux send-keys -t 1 "cd /Users/ryota/src/github.com/WOVNio/equalizer" C-m
  tmux send-keys -t 3 "cd /Users/ryota/src/github.com/WOVNio/equalizer" C-m
fi


if [ -e ~/src/github.com/WOVNio/discovery ]; then
  tmux send-keys -t 2 "cd /Users/ryota/src/github.com/WOVNio/discovery" C-m
  tmux send-keys -t 4 "cd /Users/ryota/src/github.com/WOVNio/discovery" C-m
fi


