# Tmux:

- `tmux` is a terminal multiplexer, let's call it a window manager for your terminal.
- Multitasking in a terminal environment (Linux/Mac)
- 
-

## Install:

* `apt install tmux`
* `dnf install tmux`
* `yum install tmux`
- 

## Launch tmux:

- `tmux` (launches a clean terminal window)
- `tmux a` (attaches to the running session)
- `tmux ls` (lists running sessions)
- `tmux kill-server` (kills all running sessions)
-

## Most used shortcuts:

- `Ctrl-b + %` (split window vertically)
- `Ctrl-b + "` (split window horizontally)
- `Ctrl-b + c` (new window)
- `Ctrl-b + ,` (rename window)
- `Ctrl-b + >` (resize window vertically)
- `Ctrl-b + <` (resize window horizontally)
- `Ctrl-b + z` (bring active window to front/back)
-

## Script to run tmux with multiple windows

```bash
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

```

# Tmux personal config:

```bash
unbind C-b
set -g prefix C-Space
unbind r
bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"
set -g mouse on
#start windows numbering with 1 (instead of 0)
set -g base-index 1
set-window-option -g pane-base-index 1
#activate power status
set -g @plugin 'tmux-plugins/tmux-battery'
#set -g status-left '#{battery_percentage} | #{battery_remain}'
#set -g status-left-length '50'

# default statusbar colors
set-option -g status-style fg=green,bg=black #yellow and base02

# default window title colors
set-window-option -g window-status-style fg=white,bg=default #base0 and default
#set-window-option -g window-status-style dim

# active window title colors
set-window-option -g window-status-current-style fg=black,bg=green #orange and default
#set-window-option -g window-status-current-style bright

# pane border
set-option -g pane-border-style fg=grey #base02
set-option -g pane-active-border-style fg=brightgreen #base01

# message text
set-option -g message-style fg=brightred,bg=black #orange and base01

# pane number display
set-option -g display-panes-active-colour blue #blue
set-option -g display-panes-colour brightred #orange

# clock
set-window-option -g clock-mode-colour green #green

# bell
set-window-option -g window-status-bell-style fg=white,bg=red #base02, red

# Tmux 256 colors on startup
set -g default-terminal screen-256color

# resurrect
set -g @plugin 'tmux-plugins/tmux-resurrect'

# tmux plugin manager
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
```



To run 'tmux when opening a terminal, add the following script to your '.bashrc
Script to check if tmux is running, if yes it attaches to the session else it creates a personalised session with a script:
Can be run as a script, then don't forget the shebang: #!/bin/bash
---------------------------------------------------------------------------------------------------------------------------

```bash

if [[ -z "$TMUX" ]]; then
	if tmux has-session 2>/dev/null; then
		exec tmux a
	else
		bash devmux.sh
	fi
fi
```

Script to run personalised tmux session:
----------------------------------------

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

