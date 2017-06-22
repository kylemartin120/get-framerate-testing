#!/bin/bash

declare -a thres=(300 3600 7200)
declare -a num=(25 100)

for filename in *.txt; do
    num_lines=$(wc -l < $filename)
    if [[ $num_lines -gt 99 ]]; then
	for (( i=0 ; i<3 ; i++ )); do
	    for (( j=0 ; j<2 ; j++ )); do
		dir="${filename}__${thres[$i]}_${num[$j]}"
	    	python getFramerate.py -t ${thres[$i]} -r 1000000 -d $dir\
		       -p password -f $filename -n ${num[$j]}
	    done
	done
    fi
done
