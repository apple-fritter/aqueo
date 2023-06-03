#!/bin/bash

# Prompt for device (webcam) information
read -p "Enter device (webcam) name or path: " device
read -p "Enter port number: " port
read -p "Enter username: " username
read -s -p "Enter password: " password
echo

# Start the RTSP server
echo "Starting RTSP server..."
nohup v4l2rtspserver -D "$device" -P "$port" -u "$username" -p "$password" >/dev/null 2>&1 &
echo "RTSP server started."

# Write server information to a file
echo "Device: $device" > ~/webcam_RTSPd.txt
echo "Port: $port" >> ~/webcam_RTSPd.txt
echo "Username: $username" >> ~/webcam_RTSPd.txt
echo "Password: $password" >> ~/webcam_RTSPd.txt

# Wait for user input to stop the server
read -p "Press Enter to stop the RTSP server."

# Stop the RTSP server
echo "Stopping RTSP server..."
killall v4l2rtspserver
echo "RTSP server stopped."
