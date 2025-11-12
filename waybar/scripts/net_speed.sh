#!/usr/bin/env bash
# Show upload/download speed for main interface

INTERFACE=$(ip route | awk '/default/ {print $5; exit}')
RX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_PREV=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
RX_NOW=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_NOW=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

RX_DIFF=$((RX_NOW - RX_PREV))
TX_DIFF=$((TX_NOW - TX_PREV))

RX_KB=$((RX_DIFF / 1024))
TX_KB=$((TX_DIFF / 1024))

ICON="󰈀"
echo "{\"text\":\"$ICON ${RX_KB}KB↓ ${TX_KB}KB↑\",\"alt\":\"net_speed\"}"
