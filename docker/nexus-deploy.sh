#!/bin/bash

# Helper shell script to upload the conda repo to nexus
for f in $(find ./out/conda-bld -type f); do
  curl -T "$f" -u $NEXUSUSER:$NEXUSPASS https://nexus.devops.geointservices.io/content/repositories/beachfront-conda/$f
done

