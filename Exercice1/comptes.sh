#!/bin/bash
echo "Nombre de Location en 2016:"
cat ann/2016/* | grep Location | wc -l

echo "Nombre de Location en 2017:"
cat ann/2017/* | grep Location | wc -l

echo "Nombre de Location en 2018:"
cat ann/2018/* | grep Location | wc -l


