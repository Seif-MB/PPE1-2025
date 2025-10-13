#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <entité>"
    exit 1
fi

entity=$1
for year in 2016 2017 2018
do
    count=$(./compte_par_type.sh $year $entity)
    echo "$year : $count"
done
