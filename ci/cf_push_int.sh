#!/bin/bash -ex

export PIAZZA_ADDR=piazza.int.geointservices.io
export MANIFEST_FILENAME=manifest.int.yml

./ci/_cf_push.sh
