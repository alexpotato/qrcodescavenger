#!/bin/bash

ls *.jpeg | sort -R > shuffled.images.txt

a=1
for i in $(cat shuffled.images.txt)
do
    echo $a
    echo "<html>" > $a.html
    echo "<body>" >> $a.html
    echo "<h1>Clue: $a</h1>" >> $a.html
    echo "<img style='max-width: 500px;' src='$i'></img>" >> $a.html
    echo "</body>" >> $a.html
    echo "</html>" >> $a.html
    a=$( echo "$a + 1" | bc)    
done
