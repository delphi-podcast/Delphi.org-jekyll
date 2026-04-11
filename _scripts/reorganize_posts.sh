#!/bin/bash
# Reorganizes older posts into YYYY/MM/ subdirectories.

CURRENT_YEAR=$(date +%Y)
POSTS_DIR="_posts"

cd "$POSTS_DIR" || exit 1

echo "Reorganizing posts older than $CURRENT_YEAR..."

# Enable nullglob so loop doesn't run if no files match
shopt -s nullglob

for file in *.md; do
    # Ensure it's a file
    if [ -f "$file" ]; then
        # Extract year and month from filename (format: YYYY-MM-DD-title.md)
        year=$(echo "$file" | cut -d'-' -f1)
        month=$(echo "$file" | cut -d'-' -f2)

        # Check if year is a valid number and older than current year
        if [[ "$year" =~ ^[0-9]{4}$ ]] && [ "$year" -lt "$CURRENT_YEAR" ]; then
            # Create target directory
            target_dir="$year/$month"
            mkdir -p "$target_dir"
            
            # Move the file
            mv "$file" "$target_dir/"
            echo "Moved $file -> $target_dir/"
        fi
    fi
done

echo "Reorganization complete."
