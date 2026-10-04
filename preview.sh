cat << 'EOF' > generate-wallpapers-readme.sh
#!/bin/sh

WALLPAPER_DIR="config/walls"
OUTPUT_FILE="${WALLPAPER_DIR}/README.md"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: $WALLPAPER_DIR directory does not exist. Check your path with 'pwd'."
    exit 1
fi

cat << 'HEADER' > "$OUTPUT_FILE"
# Wallpapers

<table>
HEADER

col=0
find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | sort | while read -r img; do
    rel_path=$(python3 -c "import os, sys; print(os.path.relpath(sys.argv[1], sys.argv[2]))" "$img" "$WALLPAPER_DIR" 2>/dev/null || echo "${img#$WALLPAPER_DIR/}")

    if [ $col -eq 0 ]; then
        printf "  <tr>\n" >> "$OUTPUT_FILE"
    fi

    printf '    <td width="33%%"><a href="%s"><img src="%s"></a></td>\n' "$rel_path" "$rel_path" >> "$OUTPUT_FILE"
    col=$((col + 1))

    if [ $col -eq 3 ]; then
        printf "  </tr>\n" >> "$OUTPUT_FILE"
        col=0
    fi
done

if [ $col -ne 0 ]; then
    printf "  </tr>\n" >> "$OUTPUT_FILE"
fi

printf "</table>\n" >> "$OUTPUT_FILE"

echo "Wrote $(grep -c '<img' "$OUTPUT_FILE") images to $OUTPUT_FILE"
EOF

chmod +x generate-wallpapers-readme.sh
./generate-wallpapers-readme.sh
