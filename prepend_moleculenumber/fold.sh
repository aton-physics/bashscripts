#!/bin/bash
#Accept data file as command line argument
#return data file but with periodic boundary conditions applied to the positions
#logic: NR starts counting from 1.
filename=$1
N=200
boxl=$(echo "sqrt( $N / $density )" | bc -l)
boxinv=$(echo "1 / $boxl" | bc -l)
awk -v boxl="$boxl" 'function fold(x) {return x - int(x / boxl + (x >= 0.0 ? 0.5 : -0.5) boxl)} {$1 = fold($1); print}' $1 > foldpositions.data
