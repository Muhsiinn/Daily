#!/usr/bin/env bash

# 1️⃣ Play your ASCII animation
python3  image.py 

# 2️⃣ Then display system info manually
echo
echo "┌─[System Info]──────────────────────────────────"
echo "│ Hostname:   $(hostname)"
echo "│ Kernel:     $(uname -r)"
echo "│ Uptime:     $(uptime -p)"
echo "│ CPU:        $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2-)"
echo "│ Memory:     $(free -h | awk '/^Mem:/ {print $3 \" used / \" $2 \" total\"}')"
echo "└───────────────────────────────────────────────"
