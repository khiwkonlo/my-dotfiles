#!/usr/bin/env bash
# Microphone status for Waybar (PipeWire, safe version)

# Get the source ID safely (numeric)
SOURCE=$(wpctl status | awk '/Sources:/{flag=1; next} /Sinks:/{flag=0} flag' | grep '^\*' | awk '{print $3}' | tr -d '[]')

# If no source found
if [ -z "$SOURCE" ]; then
  echo '{"text":"󰍬","tooltip":"No mic detected","class":"mic","color":"#f38ba8"}'
  exit 0
fi

# Check if mic is muted
if wpctl get-volume "$SOURCE" | grep -q MUTED; then
  ICON="󰍭"
  COLOR="#f38ba8"  # red muted
else
  ICON="󰍬"
  COLOR="#89b4fa"  # blue active
fi

# Output valid JSON for Waybar
echo "{\"text\":\"$ICON\",\"tooltip\":\"Microphone\",\"class\":\"mic\",\"color\":\"$COLOR\"}"
