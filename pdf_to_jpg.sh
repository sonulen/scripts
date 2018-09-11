#!/bin/sh

echo "Convert" $1 "to png ..."
convert -density 300 "$1" page_%04d.jpg
echo "Completed!"
