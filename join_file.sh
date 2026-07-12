#!/bin/bash

echo "Rejoining chunks into Obsidian_Restored.exe..."

# Combines all files starting with 'obsidian_chunk_' in order
cat obsidian_chunk_*.part > Obsidian_Restored.exe

if [ $? -eq 0 ]; then
    echo "Done! File restored as Obsidian_Restored.exe"
    # Optional: Verify size
    ls -lh Obsidian_Restored.exe
else
    echo "Error: Failed to join files."
fi
