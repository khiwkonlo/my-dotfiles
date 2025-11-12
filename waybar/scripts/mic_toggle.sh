#!/usr/bin/env bash
SOURCE=$(wpctl status | grep -A2 "Sources:" | grep -m1 "*" | awk '{print $2}')
[ -n "$SOURCE" ] && wpctl set-mute "$SOURCE" toggle
