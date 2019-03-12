#!/bin/bash
#loop through files, combine them so I can plot them directly
#argument 1 gives the directory name
#example call: ./Prepend_correlation.sh 201 2001 1
#./Prepend_correlation.sh 211 2011 2
#./Prepend_correlation.sh 221 2021 3
#./Prepend_correlation.sh 231 2031 4
#./Prepend_correlation.sh 241 2041 5
#./Prepend_correlation.sh 251 2051 6
ARRAY=(Scattering msd Orientation6Correlation Orientation2Correlation CollectiveOrientation6Correlation)
for directory in "${ARRAY[@]}"
do
mkdir plot
head -n 1001 "$directory/$1.data" > "plot/$directory$3.data" #want all of the data points from the short time trajectory
tail -n +3 "$directory/$2.data" >> "plot/$directory$3.data" #pull data from the whole file but discards the first lines
done
