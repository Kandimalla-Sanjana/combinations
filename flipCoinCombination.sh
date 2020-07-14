#! /bin/bash
coin=$((RANDOM%2))
if [ $coin -eq 0 ]
then
	echo "Tails"
else
	echo "Heads"
fi
