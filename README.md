# pzsvc-ndwi-py

## Overview

The ndwi shore-finding algorithm, written in python, and made into a Piazza service via pzsvc-exec

This repo contains various git submodules for the dependent projects that are 
integrated by `pzsvc-ndwi-py`.

This is a configuration repo meant to be used to deploy `pzsvc-ndwi-py` to
cloudfoundry. It uses [miniconda](https://conda.io/miniconda.html) to package
each application and then stores them in a Nexus repository. Then cloudfoundry
uses miniconda to pull the packages and dependencies and deploy them in a 
container.

Here's how the whole thing works:

1. These apps are submodules within the `conda-recipes/vendor` directory:
    - gippy
    - beachfront-py
    - pzsvc-exec
    - bfalg-ndwi
    - pypotrace 
2. Updates to this repo trigger a pipeline job in Jenkins
4. The repo is cloned and submodules are inited
5. Security scans are run on our code and the results sent to threadfix
6. If no `High` or `Criticals` are found, a
docker build container builds the conda packages and creates a repo
8. The conda  repo is then stored in Nexus for later retrieval during cloudfoundry
deployment
9. A `cf push` then deploys `pzsvc-ndwi-py` to cloudfoundry


## Conda Build Process

You can find more detailed [documentation](./conda-recipes/README.mkd) for the
conda build process in the `./conda-recipes` directory in this repo.


