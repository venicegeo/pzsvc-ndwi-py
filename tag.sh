#!/bin/bash
tag=$1
if [ -z "$tag" ]; then
  exit 1
fi
sed -i "s/bfalg-ndwi=x/bfalg-ndwi=$tag/g" environment.yml
sed -i "s/pzsvc-exec=x/pzsvc-exec=$tag/g" environment.yml
