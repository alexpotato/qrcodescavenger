#!/bin/bash
# get number of images
images=$(wc -l shuffled.images.txt | cut -d" " -f1)
final=$((images + 1))
for i in $(seq 1 $final)
do 
    echo $i
    qrencode -lH "http://shuttle:9000/$i.html" -o $i.png
done
