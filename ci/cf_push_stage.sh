#!/bin/bash -e

export PCF_SPACE=stage
export PCF_DOMAIN=stage.geointservices.io

./ci/cf_push.sh
