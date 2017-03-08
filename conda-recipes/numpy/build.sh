#!/bin/bash

N=$(nproc)
$PYTHON setup.py build -j $N install
