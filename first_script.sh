#!/bin/bash
# edit first lines of files with particular names separated by a number
for value in {1..55}
do
filename="Average"$value".data" #at each instance of the loop, pick a new file
var=$(awk 'NR==1{print $1 "\t" 1.0/$2}' $filename) #read first line of the file, save field 1 and inverse field 2 as a string
sed -i "1s/.*/$var/" $filename #replace entire line with the string obtained by awk
#sed -i "1s/0.599999/0.6/" $filename
#sed -i "1s/0.700001/0.7/" $filename
#sed -i "1s/0.333333/0.33/" $filename
done
echo All done
