########################
### Custom functions ###
########################
# Compile a C file with clang
cl() {
    if [ -z "$1" ]; then
        echo "Usage: cl <filename>"
        return 1
    fi

    local filename="${1%.c}"
    clang -o "$filename" "$1"
}

# Spellcheck a word using aspell and fzf for selection
spellcheck() {
    echo "$1" | tr ' ' '\n' | aspell list | fzf
}