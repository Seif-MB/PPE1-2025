#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <année> <entité>"
    exit 1
fi
year=$1
entity=$2

if [[ ! "$year" =~ ^(2016|2017|2018)$ ]]; then
    echo "Erreur : année invalide. Choisir 2016, 2017 ou 2018."
    exit 1
fi

grep -h "$entity" ann/$year/* | wc -l
