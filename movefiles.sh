#!/bin/bash
for value in {1800..2000}
do
filename="C_t"$value".data"
filename2="C_t"$value".data.gz"
filename3="C_t"$value".data.gz.xz"
filename4="C_t"$value".data.xz"
mv $filename /home/aton/N50Gif/transfer
mv $filename2 /home/aton/N50Gif/transfer
mv $filename3 /home/aton/N50Gif/transfer
mv $filename4 /home/aton/N50Gif/transfer
done
