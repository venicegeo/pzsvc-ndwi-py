#!/bin/bash
v=$1
if [ -z "$v" ]; then
  exit 1
fi
sed -i "s/REPLACE_VERSION/$v/g" environment.yml
