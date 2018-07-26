#!/bin/bash
filename=$1
NumConfigs=1000
LineNumber=1
for ((i=0; i < $NumConfigs; i++ ))
do
for value in {1..50} #2 is the number of molecules
do
for value2 in {1..3}
do
num=$(( $value2 + ($value - 1) * 3)) #assign the molecules their numbers
#var=$(awk -v var=$LineNumber quote NR==var{print  quotes \t quotes $1 quotes \t quotes $2}' $filename) #pull the c-th line from file
#sed -i quotes $LineNumber s/^/$value/ quotes $filename #write the molecule number and the rest of the line back to the file
awk '$0=$value"\t"$0' 
((++LineNumber))
done
done
echo $i
done
