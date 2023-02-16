#!/bin/bash

# Check if the input file and output directory were provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 [input_file] [output_directory]"
    exit 1
fi

# Get the input file and output directory from the command line
input_file=$1
output_dir=$2

# Loop through each file in the output directory
for file in "$output_dir"/*; do
    # Check if the file is a regular file (not a directory or a symlink)
    if [ -f "$file" ]; then
        # Copy the contents of the input file to the output file
        cp "$input_file" "$file"
    fi
done
