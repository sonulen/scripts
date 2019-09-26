#!/bin/bash
var1=0

if [  -n "$1"  ]
then
	if [  "$1" -le  255 ]
	then
	if [ "$1" -ge 0 ]
	then
	var1=1
	fi
	fi
fi

if [ $var1  -eq 1 ]
then
echo okay. w8 a sec...
sudo sh -c "echo $1 >>/sys/class/hwmon/hwmon1/device/hwmon/hwmon1/pwm1 "
echo done!
else
echo incorrect input data dude.
echo set 0 if u want off fans and 255 for setting max rpm
fi