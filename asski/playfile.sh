#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Enhanced ASCII Animation With System Info
# ------------------------------------------------------------------------------
# - Dynamically divides terminal between ASCII art and sysinfo
# - Uses ANSI colors for sysinfo
# - Press Ctrl+C to exit cleanly
# ------------------------------------------------------------------------------

FRAME_DIR="/mnt/d/code/asski/ascii_frames"
INTERVAL=0.1                # seconds per frame (adjust for speed)

# Capture system info once (won't change during runtime).
# Format of each line: "Label: value"
sysinfo=()
while IFS= read -r line; do
    sysinfo+=("$line")
done < <(neofetch --stdout \
    --disable ascii_title \
    --disable ascii_colors \
    --disable ascii)

# Get the list of frames (pre-generated .txt files)
mapfile -t frames < <(ls "$FRAME_DIR"/*.txt | sort)

# Trap Ctrl+C to restore cursor and exit
tap_exit() {
    tput cnorm
    clear
    exit
}
trap tap_exit SIGINT

# Hide cursor for smooth animation
tput civis

#while true; do
    # Re-calc terminal dimensions in case of resize
    term_cols=$(tput cols)
    term_lines=$(tput lines)

    # Allocate 55% of terminal width to ASCII, 45% to sysinfo (minus 2 spaces)
    ascii_width=$(( term_cols * 55 / 100 ))   # 55% for ASCII
    info_width=$(( term_cols - ascii_width - 2 ))  # 2 columns of padding

    # Loop through each ASCII frame
    for frame in "${frames[@]}"; do
        clear
        # Read ASCII frame into array (each line)
        mapfile -t art < "$frame"

        # Print line by line, combining art + sysinfo
        for ((i=0; i<term_lines; i++)); do
            # Determine ASCII art line (or blank if beyond frame height)
            if (( i < ${#art[@]} )); then
                line_art="${art[i]}"
                # Pad or truncate to fit ascii_width
                printf -v padded_art "%-${ascii_width}s" "$line_art"
            else
                # Blank line for art
                printf -v padded_art "%-${ascii_width}s" ""
            fi

            # Print sysinfo if available on this line index
            if (( i < ${#sysinfo[@]} )); then
                # Split into label and the rest (value) on the first colon
                IFS=":" read -r key val_rest <<< "${sysinfo[i]}"
                # Trim leading space from value
                val=$(echo "$val_rest" | sed 's/^ //')
                # Colorize: label in bold cyan, value in bold white
                label_colored="$(tput setaf 6)$(tput bold)$key:$(tput sgr0)"
                value_colored="$(tput setaf 7)$(tput bold)$val$(tput sgr0)"
                info_line="$label_colored $value_colored"
                # Pad or truncate sysinfo to fit info_width
                printf "%s  %-*s\n" "$padded_art" $info_width "$info_line"
            else
                # No sysinfo beyond its lines
                printf "%s\n" "$padded_art"
            fi
        done

        # Wait before next frame
        sleep "$INTERVAL"
    done

    # Option: remove 'while true' to play once, or keep for loop
done