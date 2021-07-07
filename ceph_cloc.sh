#!/bin/sh
FILE="test_hashes.txt"

#Uncomment after testing
#should also check that shell scripts are executable
#sh ./setup.sh

#Read hashes from file, run cloc with each hash in ceph repo
while IFS= read -r line
do
    echo "$line"
    cd ceph
    cloc . --git $line
    cd ..
done < $FILE
