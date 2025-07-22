all: README.md

README.md: guessinggame.sh
	echo "# Guessing Game Project" > README.md
	echo "Generated on: $$(date)" >> README.md
	echo "Number of lines in guessinggame.sh: $$(wc -l < guessinggame.sh)" >> README.md
