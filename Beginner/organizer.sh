#!/bin/bash

handle_error() {
	echo "Error: $1" >&2
	exit 1
}

read -p "Source directory: " source_dir
read -p "Destination directory: " dest_dir

[[ -d "$source_dir" ]] || handle_error "Source directory does not exists."
mkdir -p "$dest_dir" || handle_error "Failed to create destination directory."

for file in "$source_dir"/*; do

	if [[ -f $file ]]; then
		filetype=$(file -b $file | awk '{print $1}')
		mkdir -p "$dest_dir"/"$filetype" || handle_error "Failed to create subdirectory."
		cp $file "$dest_dir"/"$filetype" || handle_error "Failed to copy \"$file\" to \"$dest_dir/$filetype\"."
	fi
done

echo "File organization is completed."
