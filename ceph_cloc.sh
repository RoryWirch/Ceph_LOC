#!/bin/sh
FILE="hashes.txt"

#Uncomment after testing
#should also check that shell scripts are executable
#sh ./setup.sh

#Read hashes from file
while IFS= read -r line
do
    echo "$line"
done < $FILE