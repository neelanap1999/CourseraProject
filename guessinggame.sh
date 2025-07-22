#!/usr/bin/env bash
# File: guessinggame.sh

function get_file_count {
  echo $(ls -1 | wc -l)
}

echo "Welcome to the guessing game!"
echo "Can you guess how many files are in the current directory?"

file_count=$(get_file_count)
guess=-1

while [[ $guess -ne $file_count ]]
do
  read -p "Enter your guess: " guess

  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    continue
  fi

  if [[ $guess -lt $file_count ]]; then
    echo "Too low!"
  elif [[ $guess -gt $file_count ]]; then
    echo "Too high!"
  fi
done

echo "Congratulations! You guessed it right. 🎉"
