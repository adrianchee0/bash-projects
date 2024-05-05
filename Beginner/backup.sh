#!/bin/bash

echo "** Backup Script **"

read -p "Source Directory/File: " source_dir

if [ ! -e "$source_dir" ]; then
	echo "Error: Source directory/file does not exist."
	exit 1
fi

read -p "Destination Directory: " dest_dir

mkdir -p "$dest_dir"

read -p "Name for the backup archive (without extension): " backup_name

tar -czvf "$dest_dir/$backup_name.tar.gz" "$source_dir"

if [ $? -eq 0 ]; then
	echo "$backup_name.tar.gz Backup completed successfully to -> $dest_dir"
else
	echo "Error: Backup failed."
fi
