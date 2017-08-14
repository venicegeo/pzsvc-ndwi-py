#!/bin/bash -ex
chmod 700 ./ci/cf_push_prod.sh

./ci/cf_push_prod.sh
