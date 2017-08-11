#!/bin/bash -e

export PCF_SPACE=prod
export PCF_DOMAIN=geointservices.io

./ci/cf_push.sh
