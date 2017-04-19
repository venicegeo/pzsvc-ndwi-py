#!/bin/bash

echo "Starting conda build..."
export PATH="$HOME/miniconda2/bin:$PATH"
pushd `dirname $0`/pzsvc-ndwi-repo > /dev/null
root=$(pwd -P)
echo "***Updating conda..***"
conda update -n root conda-build -y
conda update --all -y
echo "***Building libagg...***"
conda build agg
conda config --add channels local
echo "***Building pypotrace...***"
conda build pypotrace
echo "***Buillding gippy...***"
conda build gippy
echo "***Building beachfront...***"
conda build beachfront
echo "***Building bfalg-ndwi...***"
conda build bfalg-ndwi
popd > /dev/null
cp -r $HOME/miniconda2/conda-bld /$HOME/conda-repo

