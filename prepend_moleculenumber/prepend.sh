#!/bin/bash
#Accept data file as command line argument
#return data file but with serial prefixes to each line.
#logic: NR starts counting from 1.
filename=$1
awk ' {printf "%d\t%s\n", int((NR - 1) % 150 / 3), $0}' $1 > testfile.data
