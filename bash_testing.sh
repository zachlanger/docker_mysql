#!/bin/sh

a=$1

while [ $a -gt 0 ]
do
   echo $a
   a=`expr $a - 1`
done
