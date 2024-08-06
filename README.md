# QR Code Scavenger hunt

## Description

* This is a simple tool for putting together a scavenger hunt using QR codes and photo clues

## Requirements

* Linux or MacOs
* python3
* qrencode (or equivalent CLI tool for MacOS)

## Tech Setup

The below assumes everything is happening in the same directory that you cloned the repo into.

* Take a bunch of photos to use as "clues"
    * e.g. photo of the kitchen, photo of the laundry room etc
* Save the files with a jpeg extension an dmake the filename descriptive 
    * e.g. `kitchen.jpeg`
* Run the `shuffle.images.sh` script
    * This will create a file called `shuffled.images.txt`
* Start the local webserver e.g. below starts it on port 9000
    * `python3 -mhttp.server 9000`
* Open up `generate.qr.sh` and set the URL variable to the hostname and port for your webserver
    * Use the values from the previoues step
* Run the `generate.qr.sh`
    * This will create png files for each of the QR codes
* Run the `generate.html.sh` script
    * This will generate:
        * `main.html` that tells you wher eto put each QR code
        * `qr.html` which is a printout of all of the QR codes
        * Multiple html files in the format `1.htnl` etc that have the photo for the next clue


## Physical Setup

* Print out the QR code page at `http://hostname:9000/qr.html`
* Cut out each QR code
    * Make sure to have each QR code slip have the number on it as this makes it easier to keep track of which QR code goes where
* Print out the instructions page at `http://hostname:9000/main.html` as this tells you where to put everything
* Put QR code `1` aside as this is what starts everything off
* Have someone hide each QR code in the corresponding place using the `main.html` as a guide

## Playing

* Use a phone/tablet etc to scan QR code 1
* Make sure your phone is on the same network as the webserver. 
* Use the phone to lookup QR `1` and it should take you to the first clue
* Have fun!

## Playing Again

If you want to play again:

* run `shuffle.images.sh`
* print out `main.html`
    * This will have a new order of the clues
* You can reuse the QR codes or print them out again from `qr.html`
* Follow the steps from *Physical Setup*
