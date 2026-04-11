#!/bin/bash
# Processes high-res images to AVIF and organizes them by YYYY/MM.
# Smart logic: Only converts formats or resizes when absolutely necessary.
# Sanitizes filenames (spaces -> underscores) and updates assets/RAW/current.md.

# --- Ensure script runs from project root ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT" || exit 1

RAW_DIR="assets/RAW"
PROCESSED_DIR="assets/RAW/processed"
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)
OUT_DIR="assets/images/${CURRENT_YEAR}/${CURRENT_MONTH}"
MAX_WIDTH=1200
CURRENT_MD="${RAW_DIR}/current.md"

# Check for tools
if ! command -v convert &> /dev/null; then echo "Error: ImageMagick (convert) missing."; exit 1; fi
if ! command -v avifenc &> /dev/null; then echo "Error: libavif-bin (avifenc) missing."; exit 1; fi
if ! command -v identify &> /dev/null; then echo "Error: ImageMagick (identify) missing."; exit 1; fi

mkdir -p "$RAW_DIR" "$PROCESSED_DIR" "$OUT_DIR"
shopt -s nullglob

# --- 1. Cleanup/Repair from previous failed run ---
for archived in "$PROCESSED_DIR"/*.{png,jpg,jpeg,JPG,JPEG,PNG,webp,WEBP}; do
    base_orig=$(basename "${archived%.*}")
    # Note: Repair logic is tricky with sanitization, we check if ANY .avif exists for this base
    # (simplification: if the original name or sanitized name exists, we assume it's fine)
    base_clean="${base_orig// /_}"
    if [ ! -f "$OUT_DIR/$base_clean.avif" ] && [ ! -f "$OUT_DIR/$base_orig.avif" ]; then
        mv "$archived" "$RAW_DIR/"
        echo "Found orphaned original: Moved $base_orig back to RAW for processing."
    fi
done

echo "Checking $RAW_DIR for images..."

NEW_ENTRIES=""
PROCESSED_COUNT=0

for img in "$RAW_DIR"/*.{png,jpg,jpeg,JPG,JPEG,PNG,webp,WEBP}; do
    if [ -f "$img" ]; then
        filename=$(basename -- "$img")
        base_orig="${filename%.*}"
        extension="${filename##*.}"
        ext_lower="${extension,,}"
        
        # --- Sanitize Filename (Spaces -> Underscores) ---
        base_clean="${base_orig// /_}"
        
        # Check for collisions in output dir
        if [ -f "$OUT_DIR/$base_clean.avif" ]; then
            suffix=$(head /dev/urandom | tr -dc a-z0-9 | head -c 4)
            base_clean="${base_clean}_${suffix}"
            echo "Collision detected: Renaming output to $base_clean.avif"
        fi
        
        echo "------------------------------------------------"
        echo "Processing $filename -> $base_clean.avif"
        
        width=$(identify -format "%w" "$img")
        ENCODE_SRC="$img"
        IS_TEMP=false
        
        if [ "$width" -gt "$MAX_WIDTH" ] || [ "$ext_lower" == "webp" ]; then
            echo "  -> Resizing/Normalizing to temporary PNG..."
            ENCODE_SRC="/tmp/avif_prep_$base_clean.png"
            convert "$img" -resize "${MAX_WIDTH}x>" "$ENCODE_SRC"
            if [ $? -ne 0 ]; then echo "  [ERROR] ImageMagick failed."; rm -f "$ENCODE_SRC"; continue; fi
            IS_TEMP=true
        fi
        
        if [[ "$ext_lower" == "png" ]] || [[ "$IS_TEMP" == true && "$ext_lower" == "webp" ]]; then
            echo "  -> Encoding Lossless AVIF..."
            avifenc -l "$ENCODE_SRC" "$OUT_DIR/$base_clean.avif"
        else
            echo "  -> Encoding Optimized AVIF (Q60)..."
            avifenc -s 4 -j all -q 60 "$ENCODE_SRC" "$OUT_DIR/$base_clean.avif"
        fi
        
        if [ $? -eq 0 ] && [ -f "$OUT_DIR/$base_clean.avif" ]; then
            echo "  [SUCCESS] Created: $OUT_DIR/$base_clean.avif"
            [ "$IS_TEMP" == true ] && rm -f "$ENCODE_SRC"
            mv "$img" "$PROCESSED_DIR/"
            
            # Build Markdown Entry
            NEW_ENTRIES="${NEW_ENTRIES}
### $base_clean.avif

<img src=\"../images/${CURRENT_YEAR}/${CURRENT_MONTH}/${base_clean}.avif\" alt=\"$base_clean.avif\" width=\"200\" >

\`\`\`bash
/assets/images/${CURRENT_YEAR}/${CURRENT_MONTH}/${base_clean}.avif
\`\`\`

\`\`\`markdown
![$base_clean](/assets/images/${CURRENT_YEAR}/${CURRENT_MONTH}/${base_clean}.avif \"$base_clean\")
\`\`\`

\`\`\`html
<img src=\"/assets/images/${CURRENT_YEAR}/${CURRENT_MONTH}/${base_clean}.avif\" alt=\"$base_clean\">
\`\`\`
"
            ((PROCESSED_COUNT++))
        else
            echo "  [ERROR] Conversion failed. File left in RAW/ for inspection."
            [ "$IS_TEMP" == true ] && rm -f "$ENCODE_SRC"
        fi
    fi
done

# --- 5. Update current.md ---
if [ $PROCESSED_COUNT -gt 0 ]; then
    echo "Updating ${CURRENT_MD}..."
    if [ ! -f "$CURRENT_MD" ]; then
        cat << EOF > "$CURRENT_MD"
# Recent Images

Useful snippits:

* style="float: right"
* style="float: left"

---
EOF
    fi

    FULL_BLOCK="
## /assets/images/${CURRENT_YEAR}/${CURRENT_MONTH}/
${NEW_ENTRIES}"

    TMP_MD="/tmp/current_md_update.md"
    sed -n '1,/^---$/p' "$CURRENT_MD" > "$TMP_MD"
    echo "$FULL_BLOCK" >> "$TMP_MD"
    sed '1,/^---$/d' "$CURRENT_MD" >> "$TMP_MD"
    mv "$TMP_MD" "$CURRENT_MD"
fi

# Update symlink
ln -sfn "../images/${CURRENT_YEAR}/${CURRENT_MONTH}" "${RAW_DIR}/current_images"
echo "------------------------------------------------"
echo "Updated link: ${RAW_DIR}/current_images -> ${OUT_DIR}"
echo "Image processing complete ($PROCESSED_COUNT images added to current.md)."
