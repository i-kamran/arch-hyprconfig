#!/bin/bash


print_usage() {
  echo "Usage ./add_personal_dict_aspell.sh <word> [<word> ...]"
  echo "Script located at $0"
}

# Check if at least one word is provided
if [ $# -lt 1 ]; then
  print_usage
fi


FILE="$HOME/.aspell.en.pws"
if [ ! -f $FILE ]; then
  echo -e "personal_ws-1.1 en 0\npersonal\ndictionary" > $FILE
fi

# Get the current count
count=$(grep 'personal_ws-1.1' "$FILE" | awk '{ print $NF }')

for word in "$@"; do
  echo "$word" >> "$FILE"
  count=$((count + 1))
  sed -i "1s/personal_ws-1.1 en [0-9]\+/personal_ws-1.1 en $count/" "$FILE"
  
done

