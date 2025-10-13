#!/bin/bash

year=$1
month=$2
top_n=$3

if [[ ! "$year" =~ ^(2016|2017|2018|\*)$ ]]; then
    echo "Erreur : année invalide. Choisir 2016, 2017, 2018 ou *."
    exit 1
fi


if [[ ! "$month" =~ ^([0-9]{2}|\*)$ ]]; then
    echo "Erreur : mois invalide. Format 01..12 ou *."
    exit 1
fi


if ! [[ "$top_n" =~ ^[0-9]+$ ]]; then
    echo "Erreur : nombre invalide. Doit être un entier."
    exit 1
fi


if [ "$year" = "*" ]; then
    files="ann/*/*"
else
    files="ann/$year/*"
fi

if [ "$month" != "*" ]; then
    files=$(echo $files | grep "_$month_")
fi

grep -h "Location" $files | awk '{print $NF}' | sort | uniq -c | sort -nr | head -n $top_n
