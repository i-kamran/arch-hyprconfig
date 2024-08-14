#!/bin/bash

##########################
### Auto Commit Script ###
##########################

# This tool automates the git commit process with customizable options.
# It supports skipping typo-checking, length checking, and opening an editor for commit messages.
# Use it to easily add and commit files with a specific commit message

# Function to print usage instructions
print_usage() {
    echo "Usage: ./auto_commit.sh [-n] [-l] <commit_message> <file1> [<file2> ...]"
    echo "Options:"
    echo "  -n     Skip typo-checking and commit directly"
    echo "  -e     Open editor to write a commit message"
    echo "  -l     Allow commit only if commit message length is more than 50 characters"
    echo "Script located at $0"
    exit 1
}

# Check if at least one file name is provided
if [ $# -lt 2 ]; then
    print_usage
fi

# Parse command-line options
skip_typo_check=false
skip_length_check=false
open_editor=false

while getopts ":nle" opt; do
    case $opt in
        n)
            skip_typo_check=true
            ;;
        l)
            skip_length_check=true
            ;;
        e)
            open_editor=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            print_usage
            ;;
    esac
done

# Shift the options so that they are not included in the subsequent arguments
shift $((OPTIND - 1))

# Get the commit message from the arguments
commit_message="$1"
echo "$commit_message"
shift  # Remove the commit message from the arguments list

# Check for typos in the commit message using aspell if not skipped
if [ "$skip_typo_check" = false ]; then
    if echo "$commit_message" | aspell list | grep .; then
        echo -e "\e[31mError: Potential typo found in the commit message.\e[0m"
        echo "Please review and retype your commit message."
        exit 1
    fi
fi

# Check commit message length if length check flag is set
char_count=${#commit_message}

if [ "$skip_length_check" = false ]; then
    if [ "$char_count" -gt 50 ]; then
        echo -e "\e[31mError: Commit message should be less than 50 characters.\e[0m"
        echo "Character count: $char_count"
        exit 1
    fi
fi

# Run git commands for each file
for file_name in "$@"; do
    git add "$file_name"
done

# Commit all changes with the specified message
if [ "$open_editor" = true ]; then
    git commit -m "$commit_message" -e
else
    git commit -m "$commit_message"
fi

# Print "Changes committed successfully." in green along with character count if length check flag is set

echo -e "\e[32mChanges committed successfully. Character count: $char_count\e[0m"
