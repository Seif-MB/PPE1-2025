#!/bin/bash

if [ $# -ne 0 ]; then
    echo "Usage: $0"
    echo "Ce script ne prend aucun argument."
    exit 1
fi


if [ ! -d "ann" ]; then
    echo "Erreur : le dossier 'ann' est introuvable."
    exit 1
fi

for year in 2016 2017 2018
do
    
    if [ ! -d "ann/$year" ]; then
        echo "Erreur : le dossier ann/$year est introuvable."
        exit 1
    fi

    
    echo "Nombre de Location en $year:"
    cat ann/$year/* | grep Location | wc -l
done



