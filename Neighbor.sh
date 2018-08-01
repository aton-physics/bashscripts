#!/bin/bash
#loop through files, combine them so I can plot them directly
#arg1 is the number of plots (distinct data file outputs), arg2 is the number of files per plot (I am now using 5,9)
for (( plotnumber=1; plotnumber <= $1; plotnumber++ ))
do
var=$(( (plotnumber - 1) * $2 + 1)) 
outputfilename1="Energyplot$plotnumber.data"
awk -v var=$var 'NR==var{print $2 "\t N=50"}' input.txt > $outputfilename1
for (( filenumber=1; filenumber <= $2; filenumber++ ))
do
Energyname="Energy/Energy$count.data"
count=$(((plotnumber - 1)* $2 + filenumber ))
echo "count $count"
cat "$Energyname" >> "$outputfilename1"
echo "done!"
done
done