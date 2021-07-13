# Combines data for studying LOC for the ceph project
import pandas as pd
import yaml
import csv


# get version for relevant hashes
#   "ref/tags/vXX.XX.XX" -> XX.XX.XX
with open("data/commit_refs.csv","r") as hashes_refs:
    with open("data/hash_loc_data.csv",'w') as csvout:
        writer = csv.writer(csvout, lineterminator='\n')
        reader = csv.reader(hashes_refs)

        all = []
        row = next(reader)
        row.append('version')
        all.append(row)

        for row in reader:
            ref_str = row[1]
            split_arr = ref_str.split('refs/tags/v')
            if len(split_arr) == 2:
                row.append(split_arr[1])
                all.append(row)
        
        writer.writerows(all)