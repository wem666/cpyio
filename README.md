# Copy Input File to Multiple Output Files

This Bash script copies the contents of an input file to multiple output files in a specified directory.

## Usage

To use the script, run the following command:

`./copyinout.sh [input_file] [output_directory]`


* `[input_file]`: The path to the input file whose contents you want to copy to the output files.
* `[output_directory]`: The path to the directory containing the output files you want to copy the input file contents to.

The script will copy the contents of the input file to each output file in the specified directory.

Note that if either the input file or the output directory is not provided, the script will print a usage message and exit.

## Example

Suppose you have a directory `mydir` containing three output files `file1`, `file2`, and `file3`. You want to copy the contents of the input file `input.txt` to each of these files. You would run the following command in your terminal:

`./cpyio.sh input.txt mydir`
