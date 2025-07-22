# Makefile for the Guessing Game Project

# The default target is README.md, meaning 'make' will build README.md
.PHONY: all clean

all: README.md

# Target: README.md
# This rule generates the README.md file.
# It includes the project title, the date/time of make execution,
# and the line count of the guessinggame.sh script.
# The '$$' is used to escape the '$' for shell commands within make.
README.md: guessinggame.sh
	@echo "# Guessing Game Project" > README.md
	@echo "" >> README.md
	@echo "This project features a simple command-line guessing game written in Bash." >> README.md
	@echo "The game prompts the user to guess the number of files in the current directory." >> README.md
	@echo "It provides hints (too high/too low) until the correct number is guessed." >> README.md
	@echo "" >> README.md
	@echo "## Project Details" >> README.md
	@echo "" >> README.md
	@echo "- **Date and Time of Make Execution:** $$(date)" >> README.md
	@echo "- **Number of lines of code in \`guessinggame.sh\`:** $$(wc -l guessinggame.sh | awk '{print $$1}')" >> README.md
	@echo "" >> README.md
	@echo "## How to Play" >> README.md
	@echo "" >> README.md
	@echo "1.  Make sure \`guessinggame.sh\` is executable: \`chmod +x guessinggame.sh\`" >> README.md
	@echo "2.  Run the game: \`bash guessinggame.sh\`" >> README.md
	@echo "3.  Follow the prompts to guess the number of files." >> README.md
	@echo "" >> README.md
	@echo "## How to Generate README.md" >> README.md
	@echo "" >> README.md
	@echo "Simply run \`make\` in the project directory." >> README.md
	@echo "" >> README.md
	@echo "## Clean Up" >> README.md
	@echo "" >> README.md
	@echo "To remove the generated \`README.md\` file, run \`make clean\`." >> README.md


# Target: clean
# This rule removes the generated README.md file.
clean:
	@echo "Cleaning up generated files..."
	@rm -f README.md
	@echo "Clean up complete."
