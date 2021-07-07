#!/bin/sh
BASE_DIR=$(pwd)
FILE="test_hashes.txt"
TEMP_YAML="temp_yaml.yaml"
CLOC_REPORT="cloc_report.yaml"
TOTAL=`wc -l < $FILE`
CURRENT=0

sh ./setup.sh

# Runs cloc on a given hash, formats yaml output and adds to cloc report
cloc_hash()
{
    hash=$1
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
}

#Read hashes from file, run cloc on each hash in ceph repo
while IFS= read -r hash
do
    if grep -Fxq "hash:\"${hash}\"" $BASE_DIR/$CLOC_REPORT
    then
        echo "${hash} has already been cloc'd"
    else
        cloc_hash $hash
    fi
    CURRENT=$(($CURRENT + 1))
    echo "($CURRENT / $TOTAL) hashes cloc'd"
done < $FILE
