#!/bin/bash

# Helper shell script to upload the conda repo to nexus
for f in \$(find . -type f); do
  curl -T "$f" -u $NEXUSUSER:$NEXUSPASS https://nexus.devops.geointservices.io/content/sites/beachfront-conda/$f
done

