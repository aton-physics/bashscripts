#!/bin/bash

for (( it=$1; it <= $2; it++))
do
#write to an Avg file labeled by the first tag index
string1="Diffusion/Avg$1.data"
string2="Energy/Avg$1.data"
string3="Tau_orient/Avg$1.data"
truncate -s 0 "$string1"
truncate -s 0 "$string2"
truncate -s 0 "$string3"
tail -n 1 "Diffusion/$it.data" >> "$string1"
tail -n 1 "Energy/Energy$it.data" >> "$string2"
tail -n 1 "Tau_orient/$it.data" >> "$string3" 
done
