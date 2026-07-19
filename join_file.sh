#!/bin/bash

# Define the target output name and the part prefix
OUTPUT_FILE="models--handy-computer--canary-180m-flash-gguf.zip"
PART_PREFIX="handay-canary-part"

echo "Rejoining chunks into $OUTPUT_FILE..."

# Check if the parts exist before trying to combine them
if [[ -f "${PART_PREFIX}1" && -f "${PART_PREFIX}2" ]]; then
    
    # Combines the specific parts in order
    cat "${PART_PREFIX}1" "${PART_PREFIX}2" > "$OUTPUT_FILE"

    if [ $? -eq 0 ]; then
        echo "Success! File restored as $OUTPUT_FILE"
        # Display the file size of the restored file
        ls -lh "$OUTPUT_FILE"
    else
        echo "Error: Failed to join files."
        exit 1
    fi
else
    echo "Error: One or more parts (${PART_PREFIX}1, ${PART_PREFIX}2) are missing."
    exit 1
fi
