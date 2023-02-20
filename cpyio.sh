#!/bin/bash

usage() {
  echo "Usage: $0 [input_file] [output_directory] [-v]"
  echo ""
  echo "Copy the contents of input_file to all files in output_directory."
  echo ""
  echo "Options:"
  echo "  -v: verbose mode"
  exit 1
}

if [[ $# -eq 0 ]]; then
  usage
fi

input_file=""
output_directory=""
verbose=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -v)
      verbose=true
      shift
      ;;
    *)
      if [[ -z $input_file ]]; then
        input_file=$1
      elif [[ -z $output_directory ]]; then
        output_directory=$1
      else
        echo "Unknown option: $1"
        usage
      fi
      shift
      ;;
  esac
done

if [[ -z $input_file || -z $output_directory ]]; then
  usage
fi

if [[ ! -f $input_file ]]; then
  echo "Input file not found: $input_file"
  exit 1
fi

if [[ ! -d $output_directory ]]; then
  echo "Output directory not found: $output_directory"
  exit 1
fi

if [[ -n $verbose ]]; then
  echo "Copying data from $input_file to all files in $output_directory"
fi

for file in "$output_directory"/*; do
  if [[ -f "$file" ]]; then
    if [[ -n $verbose ]]; then
      echo "Copying data to file: $file"
    fi
    cp "$input_file" "$file"
  fi
done

if [[ -n $verbose ]]; then
  echo "Done copying data"
fi
