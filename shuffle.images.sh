#!/bin/bash

ls *.jpeg | sort -R > shuffled.images.txt

echo "<html><body>" > main.html
echo "<html><body>" > qr.html
a=1
for i in $(cat shuffled.images.txt)
do
    echo $a
    echo "<html><body>" > $a.html
    echo "<h1>Clue: $a</h1>" >> $a.html
    echo "<img style='max-width: 500px;' src='$i'></img>" >> $a.html
    echo "</body>" >> $a.html
    echo "</html>" >> $a.html

    # write to main for index
    echo "<h2>$a $i</h2>" >> main.html
    # generate QR page
    echo "<div>" >> qr.html
    echo "<span>$a</span>" >> qr.html
    echo "<img src='$a.png' style='border: solid 1px black;'><img>" >> qr.html
    echo "</div>" >> qr.html
    a=$(echo "$a + 1" | bc)    
done
echo "</body>" >> main.html
echo "</html>" >> main.html
