#!/bin/bash

# Define the parent directory for screenshots
SCREENSHOTS_DIR="$HOME/Desktop/Screenshots"

# Create the parent directory if it doesn't exist
mkdir -p "$SCREENSHOTS_DIR"

# Get the list of screenshot files on the desktop using -print0 to handle spaces
find "$HOME/Desktop" -maxdepth 1 -type f -name "Screenshot *.png" -print0 | while IFS= read -r -d '' screenshot; do
    # Regex to extract year and month from the screenshot filename
    # The regex includes a pattern for any kind of whitespace character
    regex="Screenshot ([0-9]{4})-([0-9]{2})-[0-9]{2} at [0-9]{1,2}\.[0-9]{2}\.[0-9]{2}[[:space:]](AM|PM)( \([0-9]+\))?\.png"
    
    if [[ "$screenshot" =~ $regex ]]; then
        year="${BASH_REMATCH[1]}"
        month="${BASH_REMATCH[2]}"
        
        # Create the year and month directory if it doesn't exist
        target_dir="$SCREENSHOTS_DIR/$year/$month"
        mkdir -p "$target_dir"
        
        # Move the screenshot to the target directory
        mv "$screenshot" "$target_dir"
        echo "Moved $screenshot to $target_dir"
    else
        echo "No match for $screenshot"
    fi
done

echo "Screenshot sorting completed."
