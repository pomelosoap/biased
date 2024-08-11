#!/bin/bash

# Get the active IPv4 address from ifconfig
local_ip=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')

# Check if the IP address was found
if [ -z "$local_ip" ]; then
  echo "No active IPv4 address found."
  exit 1
fi

# Construct the URL
url="http://$local_ip:1313"

# Start the Hugo server with the local IP
hugo server --bind "$local_ip" --baseURL "$url" --navigateToChanged
