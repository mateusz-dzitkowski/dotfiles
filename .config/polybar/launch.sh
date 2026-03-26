#!/bin/bash

# wait for the NetworkManager to start
nm-online -q

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

