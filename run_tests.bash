#!/bin/bash

for filename in *.txt; do
    num_lines=$(wc -l < $filename)
    if [[ $num_lines -gt 50 ]]; then
       python getFramerate.py
    fi
done
