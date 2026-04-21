#!/usr/bin/env bash
# 
# Release Packer by ems≈spree
# Create a ZIP-archived release package from the PhotoGIMP repository.
# 

# Filename for the ZIP archive, including a package version number.
ZIP_FILENAME="photogimp_3.$(date +'%y.%m').zip" # example: photogimp_3.26.04.zip

# List of files and directories to include in the ZIP archive.
FILES_TO_INCLUDE=(
	contextrc
	dockrc
	gimprc
	sessionrc
	shortcutsrc
	splashes
	theme.css
	toolrc
)

# Subdirectory within the repository that contains the files to be included in the ZIP archive.
SOURCE_DIR='./PhotoGIMP/.config/GIMP/3.0'

# Path to the target directory where the ZIP file will be created.
TARGET_DIR="$(dirname "$PWD")"

# Check if the source directory exists. If it does, create the ZIP archive.
# Otherwise, print an error message and exit with a non-zero status code.
if [[ -d "$SOURCE_DIR" ]]; then
	cd "$SOURCE_DIR" || exit 2
	zip -r "$TARGET_DIR/$ZIP_FILENAME" "${FILES_TO_INCLUDE[@]}" -x ".DS_Store"
else
	echo "Error: Source directory not found: $SOURCE_DIR" >&2
	exit 1
fi
