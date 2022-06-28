#!/bin/bash

tmux new-session -s l15 -n terminal -d
tmux split-window -h

tmux new-window -t l15 -d -n mail/rss
tmux send-keys -t l15:mail/rss "neomutt" Enter
tmux select-window -t l15:mail/rss
tmux split-window -h -p 20
tmux send-keys -t l15:mail/rss "newsboat" Enter

tmux new-window -t l15 -d -n mc
tmux send-keys -t l15:mc "mc" Enter

tmux new-window -t l15 -d -n weather
tmux send-keys -t l15:weather "./weather.sh" Enter
tmux select-window -t l15:weather
tmux split-window -h
tmux send-keys -t l15:weather "./facts.sh" Enter
tmux split-window -v
tmux send-keys -t l15:weather "coinmon" Enter

tmux select-window -t l15:terminal
tmux -u attach -t l15

