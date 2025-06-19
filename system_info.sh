#!/bin/bash

# System Info Script
# Author: Nickolas Torres

echo "----------------------------------------"
echo "📛 Hostname: $(hostname)"
echo "🕒 Uptime: $(uptime -p)"
echo "👤 Current User: $(whoami)"
echo "🧠 Memory Usage:"
free -h
echo "💽 Disk Usage:"
df -h | grep '^/dev'
echo "🌐 IP Address: $(hostname -I | awk '{print $1}')"
echo "📦 OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "----------------------------------------"
