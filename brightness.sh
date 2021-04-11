#!/bin/bash
var1=0

if [  -n "$1"  ]
then
	if [  "$1" -le  4296 ]
	then
	if [ "$1" -ge 300 ]
	then
	var1=1
	fi
	fi
fi

if [ $var1  -eq 1 ]
then
echo okay. w8 a sec...
sudo sh -c "echo $1 >> /sys/class/backlight/intel_backlight/brightness"
echo done!
else
echo incorrect input data dude.
echo set 300 if u want dec brightness and 4296 for max brightness
fi