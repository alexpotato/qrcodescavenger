#!/bin/bash

# Generate the index.html page
cat << EOF > index.html
<html>
<head>
<title>QR Code Scavenger Hunt Main Page</title>
</head>
<body>
<h1>QR Code Scavenger Hunt Main Page</h1>
<p>Pages:</p>
<ul>
<li><a href="main.html">List of where to place each QR Code</a></li>
<li><a href="qr.html">QR Codes to Print out</a></li>
</ul>
</body>
</html>
EOF

# get number of images
images=$(wc -l shuffled.images.txt | cut -d" " -f1)

# start the main html file
# this will have the location clues for each
# QR code/image pair
echo "<html><body>" > main.html
echo "<h2>Put <a href='1.html'>1</a> where you want the search to start</h2>" >> main.html
a=1
# build a page for each image
for i in $(cat shuffled.images.txt)
do
    echo $a
    # Generate the clue page
    echo "<html><body>" > $a.html
    echo "<h1>Clue: $a</h1>" >> $a.html
    echo "<img style='max-width: 500px;' src='$i'></img>" >> $a.html
    echo "</body>" >> $a.html
    echo "</html>" >> $a.html

    # update the main index page
    b=$((a+1))
    # write to main for index
    #if [ $a -eq $images ]
    #then
    #    echo "<h2>This is the end!">> main.html
    #else
        echo "<h2>Put <a href='$b.html'>$b</a> in $i</h2>" >> main.html
    #fi
    # generate QR page
    a=$(echo "$a + 1" | bc)    
done
# let people know that we've reached the end
echo "<h2>This is the end!">> main.html

# generate a clue
echo "<html><body>" > $a.html
echo "<h1>Clue: $a</h1>" >> $a.html
echo "<h2>Congatulations! You've reached the end." >> $a.html
echo "</body>" >> $a.html
echo "</html>" >> $a.html
echo "</body>" >> main.html
echo "</html>" >> main.html

echo "Images: $images"
rows=$(echo "$images / 5" | bc)
echo "Rows: $rows"
a=1
# here we build an html page with a table of the QR codes
# we can cut those out and then put them in the locations
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
