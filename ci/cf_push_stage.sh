#!/bin/bash -ex

export PIAZZA_ADDR=piazza.stage.geointservices.io
export MANIFEST_FILENAME=manifest.stage.yml

./ci/_cf_push.sh
