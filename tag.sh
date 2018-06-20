#!/bin/bash
tag=$1
if [ -z "$tag" ]; then
  exit 1
fi
echo "name: pzsvc-ndwi" > environment.yml
echo "channels:" >> environment.yml
echo "  - CONDA_CHANNEL" >> environment.yml
echo "dependencies:" >> environment.yml
echo "  - bfalg-ndwi=$tag" >> environment.yml
echo "  - pzsvc-exec=$tag" >> environment.yml
