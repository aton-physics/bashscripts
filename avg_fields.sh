#!/bin/bash
#should write this in a loop for variable number of files - TODO
#args = filename fileindex
#example call: ./avg_fields.sh 201 Scattering/ msd/ Orientation6Correlation/ Orientation2Correlation/ CollectiveOrientation6Correlation/ 
#./avg_fields.sh 201 Scattering/ msd/ Orientation6Correlation/ Orientation2Correlation/ CollectiveOrientation6Correlation/ 
#./avg_fields.sh 211 Scattering/ msd/ Orientation6Correlation/ Orientation2Correlation/ CollectiveOrientation6Correlation/ 
#./avg_fields.sh 221 Scattering/ msd/ Orientation6Correlation/ Orientation2Correlation/ CollectiveOrientation6Correlation/ 
#./avg_fields.sh 231 Scattering/ msd/ Orientation6Correlation/ Orientation2Correlation/ CollectiveOrientation6Correlation/ 
#./avg_fields.sh 241 Scattering/ msd/ Orientation6Correlation/ Orientation2Correlation/ CollectiveOrientation6Correlation/ 
#./avg_fields.sh 251 Scattering/ msd/ Orientation6Correlation/ Orientation2Correlation/ CollectiveOrientation6Correlation/  
ARRAY=($3 $4 $5 $6 $7)
for directory in "${ARRAY[@]}"
do
	file0="$directory$1.data"
	file1="$directory$(($1+1)).data"
	file2="$directory$(($1+2)).data"
	file3="$directory$(($1+3)).data"
	file4="$directory$(($1+4)).data"
	file5="$directory$(($1+5)).data"
	file6="$directory$(($1+6)).data"
	file7="$directory$(($1+7)).data"
	file8="$directory$(($1+8)).data"
	file9="$directory$(($1+9)).data"
	awk '{a[FNR]=$1; s[FNR]+=$2} END{for (i=1; i<=FNR; i++) print a[i], s[i]/10}' $file0 $file1 $file2 $file3 $file4 $file5 $file6 $file7 $file8 $file9 > "$directory$1avg.data"
done