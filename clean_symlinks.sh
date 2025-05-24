#!/bin/bash

# Find all symbolic links in the specified directory (or the current directory by default)
find "${1:-.}" -type l -print0 | while IFS= read -r -d $'\0' link; do
  # Check if the target of the link exists
  if ! test -e "$link"; then
    # If the target doesn't exist, print the broken link and remove it
    printf "Removing broken link: %s\n" "$link"
    rm -f "$link"
  fi
done

echo "Done!"
