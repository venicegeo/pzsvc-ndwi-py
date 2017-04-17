#!/bin/bash

echo "Starting conda build..."
export PATH="$HOME/miniconda2/bin:$PATH"
pushd `dirname $0`/pzsvc-ndwi-repo > /dev/null
root=$(pwd -P)
conda build agg
conda config --add channels local
conda build pypotrace
conda build gippy
conda build beachfront
conda build bfalg-ndwi
popd > /dev/null
cp -r $HOME/miniconda2/conda-bld /$HOME/conda-repo

