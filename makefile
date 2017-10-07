# Makefile for the guessing game.

create_readme.md:
	printf "# Guessing game\n\n\n" > README.md
	printf "Make was run at: " >> README.md
	date >> README.md
	printf "\nThe number of lines of code contained in guessinggame.sh: "  >> README.md
	cat guessinggame.sh | grep '^[[:blank:]]*[^[:blank:]#;]' | wc -l >> README.md
