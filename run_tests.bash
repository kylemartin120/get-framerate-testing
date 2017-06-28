#!/bin/bash

if [ $# -gt 0 ]; then
    password=$1
else
    password="\"\""
fi

THRES=5400
NUM=25

for filename in *.txt; do
    num_lines=$(wc -l < $filename)
    if [[ $num_lines -gt 99 ]]; then
	for (( j=0 ; j<2 ; j++ )); do
	    dir="${filename}__${THRES}_${NUM}_${j}"
	    if [ -d "$dir" ]; then
		python getFramerate.py -t $THRES -r 1000000 -d $dir\
		       -p $password -f $filename -n $NUM
	    fi
	done
    fi
done
