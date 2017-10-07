#!/bin/bash

# A guessing game.  When the program starts, users are asked how many
# files are in the current directory.  If their answer is incorrect,
# they are advised that their guess was either too low or too high and
# then they are prompted to try to guess again.  If the users guess is
# correct then they are congratulated and the program ends.

# A function for displaying hits and querying the user for anther
# guess.
function guessagain {
    printf "Your guess was too %s.\n" "$1"
    printf "Guess again: "
}

# Count the number of files in current directory.  `ls -l | grep -v
# '^d'` lists files in the current directory, without listing
# subdirectories and hidden files.  `wc -l` counts the lines, but
# since the output of the previous command has one additional line,
# that has to be subtracted.
filecount=$(ls -l | grep -v '^d' | wc -l)
filecount=$(($filecount - 1))

# A regual expression for testing whether guess was an integer.
numbertest='^-?[0-9]+$'

# Initial massage for the user.
echo "Welcome to the guessing game!"
printf "How many files are in the current directory?\nYour guess: "
# Read a new guess.
while read guess; do

    if ! [[ $guess =~ $numbertest ]]
    then
	# The guess was not an integer.
	printf "Your guess should be an integer.\nGuess again: "
    elif [[ $guess -gt $filecount ]]
    then
	# The guess was too high.
	guessagain "high"
    elif [[ $guess -lt $filecount ]]
    then
	# The guess was too low.
	guessagain "low"
    else
	# The guess was too correct.
	echo "Congratulations! You guessed correctly."
	break
    fi
done

echo "The program is now quitting."
