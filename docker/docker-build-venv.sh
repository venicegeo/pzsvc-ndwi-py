#!/bin/bash

# Downloads and builds numpy and potrace and vendorizes them using Docker

cd /root/build
virtualenv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install wheel
cd numpy-1.12.0
/usr/bin/python setup.py build_ext --inplace
cd ../
pip install -e numpy-1.12.0
cd pypotrace-0.1.3
/usr/bin/python setup.py build_ext --inplace
cd ../
pip install -e pypotrace-0.1.3
cd bfalg-ndwi
pip download -r requirements.txt -d ../../out
echo "done"

