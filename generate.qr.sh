#!/bin/bash
# get number of images
images=$(wc -l shuffled.images.txt | cut -d" " -f1)

# get the images plus one
# the plus one is for the "ending"
final=$((images + 1))

# this is the URL for your server
URL="hostname:9000"

# generate the qr images
for i in $(seq 1 $final)
do 
    echo $i
    qrencode -lH "http://$URL/$i.html" -o $i.png
done
