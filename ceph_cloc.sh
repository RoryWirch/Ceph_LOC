#!/bin/sh
BASE_DIR=$(pwd)
FILE="test_hashes.txt"
TEMP_YAML="temp_yaml.yaml"
CLOC_REPORT="cloc_report.yaml"

#Uncomment after testing
#should also check that shell scripts are executable
#sh ./setup.sh

#Read hashes from file, run cloc with each hash in ceph repo
while IFS= read -r hash
do
    echo "$hash"
    cd ceph
    cloc . --git $hash --yaml --out=$TEMP_YAML

    printf "hash:\"${hash}\"\n" >> $BASE_DIR/$CLOC_REPORT

    while IFS= read -r line
    do
        if [ "$line" != "---" ]
        then
            printf "  ${line}\n" >> $BASE_DIR/$CLOC_REPORT
        fi
    done < $TEMP_YAML

    rm $TEMP_YAML
    cd ..
    
done < $FILE
