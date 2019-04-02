#!/bin/sh
i=0

while [ 1 ]; do

  ping -q -c 1 -W 10 $1 > /dev/null

  if [ $? -ne 0 ]; then
    i=$((i+1))
    echo "Timeout #" $i
  else
    speaker-test -Dplug:surround51 -c6 -s1 -f75
  fi

  sleep 1

done
