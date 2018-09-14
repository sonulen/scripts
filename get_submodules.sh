#!/bin/sh

cd $1
echo "Finding in" $PWD "each submodules:"
echo
for n in $(find -name ".gitmodules"); do cat $n |  grep "submodule"; done
echo
echo "Completed!"
