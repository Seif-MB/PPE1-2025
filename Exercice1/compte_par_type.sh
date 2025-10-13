#!/bin/bash

year=$1
entity=$2
grep -h "$entity" ann/$year/* | wc -l
