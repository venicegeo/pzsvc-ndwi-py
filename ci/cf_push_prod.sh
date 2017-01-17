#!/bin/bash -ex

export PIAZZA_ADDR=piazza.geointservices.io
export MANIFEST_FILENAME=manifest.prod.yml

./ci/_cf_push.sh
