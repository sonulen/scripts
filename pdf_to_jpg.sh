#!/bin/sh

echo "Convert" $1 "to png ..."
convert -density 300 "$1" "$1"_page_%04d.jpg
echo "Completed!"
