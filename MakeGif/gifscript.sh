#!/bin/bash
#for (( filenumber=1; filenumber <= $1; filenumber++ ))
#do
filenumber=4
filename="Trajectory$filenumber.data" #this is not a command line argument because I want the command line argument to be how many files I want to use.
NumConfigs=100
temperature=$(awk -v var=$filenumber 'NR==var{print $3}' input.data) #pull var'th line from input file to get the configuration parameters
density=$(awk -v var=$filenumber 'NR==var{print $2}' input.data)
echo "$temperature $density"
N=50
halfboxlength=$(echo "sqrt( $N / $density ) / 2" | bc) #bash doesn't have floating points. sad.
echo "$halfboxlength"  
t=0
step=0.025
mkdir animation$filenumber
START=1
for (( value=0; value < NumConfigs; value++ ))
do
END=$(( START + 150 )) #plot 150 lines worth of data at a time
gnuplot.exe <<- EOFMarker
 set title sprintf("{/Symbol r}{/Symbol s}^2= %.2f, k_BT/{/Symbol e}= %.2f, t/{/Symbol t}= %.3f",$density,$temperature,$t)
 set terminal pngcairo enhanced
 unset colorbox
 set size square
 #boxl2=$halfboxlength
 #set xrange [-boxl2:boxl2]
 #set yrange [-boxl2:boxl2]
 set output sprintf("animation$filenumber/configuration%04.0f.png",$value)
 plot "<(sed -n '${START},${END}p' ${filename})" using 2:3:(0.5):1 with circles fill solid palette noti
EOFMarker
# rest of script, after gnuplot exits
t=$(echo $t + $step | bc)
done
#done
