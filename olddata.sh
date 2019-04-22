#!/bin/bash

for file in *txt
do
python DunesLabOldData.py -p $file >> compiled.$(date +%F).tsv
done
