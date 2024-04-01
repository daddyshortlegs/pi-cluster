#!/bin/sh
tmux new-session -d -s picluster 
tmux split-window -h 
tmux split-window -v
tmux select-pane -t picluster:0.0
tmux split-window -v
tmux send-keys -t picluster:0.1 'ssh pi@10.0.0.2' C-m
tmux send-keys -t picluster:0.2 'ssh pi@10.0.0.3' C-m
tmux send-keys -t picluster:0.3 'ssh pi@10.0.0.4' C-m
tmux select-pane -t picluster:0.0
tmux attach-session -t picluster


