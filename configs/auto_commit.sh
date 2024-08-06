#!/bin/bash

# Check if at least one file name is provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <commit_message> <file1> [<file2> ...]"
    exit 1
fi

# Get the commit message from the first argument
commit_message=$1
shift  # Remove the commit message from the arguments list

# Initialize a flag for non-existent files
non_existent_flag=false

# Check if provided files exist
for file_name in "$@"; do
    if [ ! -e "$file_name" ]; then
        echo -e "\e[31mError: File '$file_name' does not exist.\e[0m"
        non_existent_flag=true
    fi
done

# If there are non-existent files, exit with an error code
if [ "$non_existent_flag" = true ]; then
    exit 1
fi

# Check for typos in the commit message using aspell
if echo "$commit_message" | aspell list | grep .; then
    echo -e "\e[31mError: Potential typo found in the commit message.\e[0m"
    echo "Please review and retype your commit message."
    exit 1
fi

# Run git commands for each file
for file_name in "$@"; do
    git add "$file_name"
done

# Commit all changes with the specified message
git commit -m "$commit_message"

# Print "Changes committed successfully." in green
echo -e "\e[32mChanges committed successfully.\e[0m"