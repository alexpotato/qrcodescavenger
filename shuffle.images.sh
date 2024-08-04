#!/bin/bash

ls *.jpeg | sort -R > shuffled.images.txt

echo "<html><body>" > main.html
a=1
for i in $(cat shuffled.images.txt)
do
    echo $a
    echo "<html><body>" > $a.html
    echo "<h1>Clue: $a</h1>" >> $a.html
    echo "<img style='max-width: 500px;' src='$i'></img>" >> $a.html
    echo "</body>" >> $a.html
    echo "</html>" >> $a.html

    b=$((a+1))
    # write to main for index
    echo "<h2>QR $a: Put <a href='$b.html'>$b</a> in $i</h2>" >> main.html
    # generate QR page
    a=$(echo "$a + 1" | bc)    
done
echo "</body>" >> main.html
echo "</html>" >> main.html

images=$(wc -l shuffled.images.txt | cut -d" " -f1)
echo "Images: $images"
rows=$(echo "$images / 5" | bc)
echo "Rows: $rows"
a=1
echo "<html><body>" > qr.html
echo "<table border=1>" >> qr.html
for r in $(seq 0 $rows)
do
    echo "<tr>" >> qr.html
    for i in $(seq 1 5)
    do
        echo "<td style='padding: 5px;'>" >> qr.html
        echo "<div>" >> qr.html
        echo "<span>$a</span>" >> qr.html
        echo "<img src='$a.png' style='border: solid 1px black;'><img>" >> qr.html
        echo "</div>" >> qr.html
        echo "</td>" >> qr.html
        a=$(echo "$a + 1" | bc)    
    done
    echo "</tr>" >> qr.html
done
echo "</table>" >> qr.html
