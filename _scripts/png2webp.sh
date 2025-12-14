#!/bin/bash

# Initialize variables
REMOVE_REPLACE=false
FILE_MASK=""
CONVERTED_FILES=()

# Function to display usage
usage() {
    echo "Usage: $(basename "$0") [OPTIONS] \"<file_mask>\""
    echo ""
    echo "Converts PNG images to WebP and updates references in Markdown files."
    echo ""
    echo "Arguments:"
    echo "  <file_mask>       Pattern to match PNG files (e.g. \"*.png\", \"slide*\")"
    echo "                    Must be enclosed in quotes."
    echo ""
    echo "Options:"
    echo "  --remove-replace  Delete the original PNG file immediately after successful conversion."
    echo "  -h, --help        Show this help message."
    echo ""
    echo "Examples:"
    echo "  $(basename "$0") \"*.png\""
    echo "  $(basename "$0") --remove-replace \"screenshot*\""
    exit 1
}

# Parse Arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --remove-replace)
            REMOVE_REPLACE=true
            shift # past argument
            ;;
        -h|--help)
            usage
            ;;
        *)
            # Assume any other argument is the file mask
            if [ -z "$FILE_MASK" ]; then
                FILE_MASK="$1"
            else
                echo "Error: Unknown argument '$1'"
                usage
            fi
            shift # past argument
            ;;
    esac
done

# Require a file mask to run
if [ -z "$FILE_MASK" ]; then
    usage
fi

# Dependency Check
if ! command -v cwebp &> /dev/null; then
    echo "Error: cwebp is not installed. (sudo apt install webp)"
    exit 1
fi

echo "Processing mask: '$FILE_MASK'"
echo "Remove originals: $REMOVE_REPLACE"
echo "------------------------------------------------"

# Find files matching the mask
# We use while read to handle filenames with spaces correctly
find . -type f -name "$FILE_MASK" | while read -r png_path; do
    
    basename=$(basename "$png_path")
    webp_path="${png_path%.*}.webp"
    webp_basename=$(basename "$webp_path")
    conversion_success=false

    # 1. Convert Image
    if [ ! -f "$webp_path" ]; then
        cwebp -q 80 -sharp_yuv -quiet "$png_path" -o "$webp_path"
        if [ $? -eq 0 ]; then
            echo "[CONVERTED] $basename"
            conversion_success=true
            # Add to array (inside subshell, so we must print to capture later or handle immediately)
            # Since 'find | while' runs in a subshell, we can't populate a global array easily.
            # We will handle deletion/listing logic right here inside the loop.
        else
            echo "[ERROR]     Failed to convert $basename"
        fi
    else
        echo "[SKIPPED]   $basename (WebP exists)"
        # Treat pre-existing files as "success" for the sake of updating refs?
        # Usually better to only delete if we actually converted it this run,
        # but for updating MD refs, we should proceed.
        conversion_success=true
    fi

    # 2. Update References (Only if conversion "succeeded" or file existed)
    if [ "$conversion_success" = true ]; then
        
        # Smart Search (Git Index or Fallback)
        if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
            files_with_ref=$(git grep -lI "$basename" -- "*.md")
        else
            files_with_ref=$(grep -rl "$basename" --include="*.md" .)
        fi

        if [ -n "$files_with_ref" ]; then
            echo "$files_with_ref" | while read -r md_file; do
                sed -i "s/$basename/$webp_basename/g" "$md_file"
                echo "    -> Updated Ref: $md_file"
            done
        fi

        # 3. Handle Deletion or Listing
        if [ "$REMOVE_REPLACE" = true ]; then
            rm "$png_path"
            echo "    -> Deleted original: $basename"
        else
            # We echo a special marker to collect the list at the end
            echo "TO_DELETE_LIST:$png_path"
        fi
    fi

done > /tmp/png2webp_log.txt  # Capture output to process the list

# Process the log to show output and extract the list
# We do this because the pipe | creates a subshell, making array persistence hard.
cat /tmp/png2webp_log.txt | grep -v "TO_DELETE_LIST"

if [ "$REMOVE_REPLACE" = false ]; then
    echo "------------------------------------------------"
    echo "Conversion complete. To delete the originals, run:"
    echo ""
    # Extract lines starting with TO_DELETE_LIST, strip the prefix, and wrap in rm command
    grep "TO_DELETE_LIST" /tmp/png2webp_log.txt | cut -d':' -f2- | while read -r file; do
        echo "rm \"$file\""
    done
    echo ""
    echo "(You can copy-paste the lines above)"
fi

# Cleanup
rm /tmp/png2webp_log.txt