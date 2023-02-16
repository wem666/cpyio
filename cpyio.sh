#!/bin/bash

# Set up command line argument parsing
while getopts ":v" opt; do
  case $opt in
    v)
      verbose=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

# Check for required arguments
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 [input_file] [output_directory]"
  echo "  -v  Verbose mode. Print a message after the file is copied."
  echo ""
  echo "Copy an input file to an output directory. If the output directory does not exist, it will be created."
  exit 1
fi

# Get input file and output directory
input_file=$1
output_directory=$2

# Make sure input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' does not exist."
  exit 1
fi

# Make sure output directory exists, create it if not
if [ ! -d "$output_directory" ]; then
  mkdir -p "$output_directory"
fi

# Copy input file to output directory
cp "$input_file" "$output_directory"

# Print success message
if [ "$verbose" = true ]; then
  echo "Successfully copied '$input_file' to '$output_directory'."
else
  echo "Success!"
fi
