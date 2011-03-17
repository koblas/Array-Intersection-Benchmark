#!/bin/sh

for f in ./*/isect_* ; do
    b=`basename $f`
    d=`dirname $f`
    t=`echo $b | sed 's/\..*//' | awk -F_ '{printf("%-7s %2d ", $3,$2);}'`
    bj=`basename $f .java`
    bc=`basename $f .class`
    echo $b, $bj, $bc
    #if [ $b == $bj -a $b == $bc ] ; then
    #    echo -n "$t  "
    #    $f data.txt < data.txt
    #elif [ $b != $bc ]; then
    #    echo -n "$t  "
    #    java -Xms512m -Xmx1g -server $bc
    #fi
done

#echo -n 'isect_1_java.java'
#java -Xms512m -Xmx1g -server isect_1_java
#
#echo -n 'isect_2_java.java'
#java -Xms512m -Xmx1g -server isect_2_java
