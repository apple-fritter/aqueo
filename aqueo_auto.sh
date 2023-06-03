#!/bin/bash

CONFIG_FILE=~/webcam_RTSPd.txt

# Check if the configuration file exists
if [ -f "$CONFIG_FILE" ]; then
  # Read the configuration parameters from the file
  device=$(sed -n '1p' "$CONFIG_FILE" | cut -d ':' -f 2 | awk '{$1=$1};1')
  port=$(sed -n '2p' "$CONFIG_FILE" | cut -d ':' -f 2 | awk '{$1=$1};1')
  username=$(sed -n '3p' "$CONFIG_FILE" | cut -d ':' -f 2 | awk '{$1=$1};1')
  password=$(sed -n '4p' "$CONFIG_FILE" | cut -d ':' -f 2 | awk '{$1=$1};1')

  # Start the RTSP server
  echo "Starting RTSP server..."
  nohup v4l2rtspserver -D "$device" -P "$port" -u "$username" -p "$password" >/dev/null 2>&1 &
  echo "RTSP server started."
else
  echo "Configuration file not found. Exiting."
  exit 1
fi
