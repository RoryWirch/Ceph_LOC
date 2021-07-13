# Combines data for studying LOC for all ceph tags (v0.1 - most recent)
#   - ignores hashes outside of refs/tags/
#   - outputs a csv file containing:
#       - hashes
#       - ref_names
#       - version
#       - cloc data (LOC for different file extensions as well as total LOC)
import yaml
import csv

cloc_cols = ['C++', 'C/C++ Header', 'Python', 'reStructuredText', \
    'XML', 'TypeScript', 'SVG', 'Bourne Shell', 'JSON', 'YAML', 'CMake', \
    'HTML', 'Cython', 'JavaScript', 'C', 'Bourne Again Shell', 'Sass', 'Java',\
    'Assembly', 'Perl', 'Markdown', 'INI', 'make', 'Maven', 'awk', 'CSS', \
    'Ant', 'Lua', 'Windows Message File', 'SWIG', 'Dockerfile', 'D', 'SUM']

# get version and cloc data for relevant hashes
with open('data/commit_refs.csv','r') as hashes_refs,\
    open('data/cloc_report.yaml','r') as cloc_yaml,\
    open('data/cloc_data.csv','w') as csvout:
        writer = csv.writer(csvout, lineterminator='\n')
        reader = csv.reader(hashes_refs)
        cloc_data = yaml.safe_load(cloc_yaml)

        all = []
        row = next(reader)
        row.append('version')
        
        for col in cloc_cols:
            row.append(col)
        
        all.append(row)

        for row in reader:
            ref_str = row[1]
            split_arr = ref_str.split('refs/tags/v')
            if len(split_arr) == 2:
                # append version to row
                row.append(split_arr[1])
                hash = row[0]
                
                for col in cloc_cols:
                    col_LOC = cloc_data[hash][col]['code']
                    row.append(col_LOC)

                all.append(row)
        
        writer.writerows(all)