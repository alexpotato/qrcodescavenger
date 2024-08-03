#!/bin/bash
for i in $(seq 1 19)
do 
    echo $i
    qrencode -lH "http://shuttle:9000/$i.html" -o $i.png
done
