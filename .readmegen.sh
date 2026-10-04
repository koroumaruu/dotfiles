#!/bin/sh

WALLPAPER_DIR="config/walls"
OUTPUT_FILE="README.md"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: $WALLPAPER_DIR directory does not exist. Run this script from your repo root."
    exit 1
fi

cat << 'HEADER' > "$OUTPUT_FILE"
# Dotfiles

## Wallpapers

<table>
HEADER

col=0
find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | sort | while read -r img; do
    if [ $col -eq 0 ]; then
        printf "  <tr>\n" >> "$OUTPUT_FILE"
    fi

    printf '    <td width="33%%"><a href="%s"><img src="%s"></a></td>\n' "$img" "$img" >> "$OUTPUT_FILE"
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

echo "Wrote root README.md successfully."
