#!/bin/sh
echo "// Byte array generated from file $1"
echo "//    date generated: `date`"
echo "//    user: `whoami` on computer `hostname`"
echo "//    working directory: `pwd`"
echo "//    original command: $0 $1 $2"
echo
echo
echo "unsigned long $2_size=`stat -f %z $1`;"
echo "unsigned char $2[] = {"
od -t x1 $1 | sed "s/^[0-9]\{1,\} *//g" | sed "s/ *$//g" | sed "s/$/,/g" |
   sed "s/ \{1,\}/, 0x/g" | sed "s/^/0x/g" | sed "s/0x,//g"
echo "};"
