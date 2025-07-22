#!/usr/bin/env bash

# This script implements a simple guessing game.
# The user is asked to guess the number of files in the current directory.
# The game continues until the user guesses the correct number.

# Function: get_file_count
# Description: Counts the number of regular files in the current directory.
# It uses 'ls -l' to list all entries, 'grep -v "^d"' to exclude directories,
# and 'wc -l' to count the lines. It then subtracts 1 to account for the
# 'total' line that 'ls -l' often includes.
function get_file_count {
  # List all files and directories, then filter out directories (lines starting with 'd')
  # and count the remaining lines (which are files).
  # Subtract 1 because 'ls -l' output often includes a "total X" line at the beginning.
  local count=$(ls -l | grep -v "^d" | wc -l)
  echo $((count - 1))
}

# Function: guessing_game
# Description: Contains the main game logic. It retrieves the correct file count,
# then enters a loop to prompt the user for guesses until the correct answer is provided.
# It provides feedback (too high/too low) for incorrect guesses.
function guessing_game {
  local correct_answer=$(get_file_count) # Get the actual number of files
  local guess                             # Variable to store the user's guess

  echo "Welcome to the File Guessing Game!"
  echo "I'm thinking of a number... Can you guess how many files are in this directory?"
  echo ""

  # Loop indefinitely until the correct guess is made
  while true; do
    read -p "Enter your guess: " guess # Prompt the user for their guess

    # Input validation: Check if the input is a positive integer
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
      echo "Invalid input. Please enter a whole number."
      continue # Skip to the next iteration of the loop
    fi

    # Conditional logic to compare the guess with the correct answer
    if (( guess < correct_answer )); then
      echo "Your guess is too low. Try again!"
    elif (( guess > correct_answer )); then
      echo "Your guess is too high. Try again!"
    else
      echo "Congratulations! You guessed correctly! The number of files is $correct_answer."
      break # Exit the loop as the guess is correct
    fi
  done
}

# Start the game by calling the main game function
guessing_game
