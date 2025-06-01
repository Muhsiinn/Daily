#!/usr/bin/env bash

# Directory containing all ASCII frame text files
FRAME_DIR="/mnt/d/code/asski/ascii_frames"
# Directory where current_frame.txt will be written
ANIM_DIR="/mnt/d/code/asski/ascii_animation"
# Interval in seconds between frames (0.1 = 10 FPS)
INTERVAL=0.1

# Create the target directory if it does not exist
mkdir -p "$ANIM_DIR"

# Build an array of sorted frame file paths
mapfile -t frames < <(ls "$FRAME_DIR"/*.txt | sort)

# Loop through frames indefinitely
while true; do
    for frame in "${frames[@]}"; do
        # Copy the next frame into current_frame.txt
        cp "$frame" "$ANIM_DIR/current_frame.txt"
        # Wait for the specified interval
        sleep "$INTERVAL"
    done
done
