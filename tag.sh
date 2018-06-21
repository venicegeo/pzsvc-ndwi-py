#!/bin/bash
v=$1
if [ -z "$v" ]; then
  exit 1
fi
sed -i "s/bfalg-ndwi=VERSION/bfalg-ndwi=$v/g" environment.yml
sed -i "s/pzsvc-exec=VERSION/pzsvc-exec=$v/g" environment.yml
