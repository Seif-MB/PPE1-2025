#!/bin/bash

year=$1
month=$2
top_n=$3

if [ "$year" = "*" ]; then
    files="ann/*/*"
else
    files="ann/$year/*"
fi

if [ "$month" != "*" ]; then
    files=$(echo $files | grep "_$month_")
fi

grep -h "Location" $files | awk '{print $NF}' | sort | uniq -c | sort -nr | head -n $top_n
