#!/bin/bash

# Downloads and builds numpy and potrace and vendorizes them using Docker

cd /jenkins/build
virtualenv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install wheel
#curl -L "https://pypi.python.org/packages/b7/9d/8209e555ea5eb8209855b6c9e60ea80119dab5eff5564330b35aa5dc4b2c/numpy-1.12.0.zip#md5=33e5a84579f31829bbbba084fe0a4300" -o numpy-1.12.0.zip
#unzip numpy-1.12.0.zip
#rm numpy-1.12.0.zip
cd numpy-1.12.0
/usr/bin/python setup.py build_ext --inplace
cd ../
pip install -e numpy-1.12.0
#curl -L https://pypi.python.org/packages/28/6f/59ebf9fa50553426d28c0aec6d0690e84cca3841edd10276afaaedb8d02b/pypotrace-0.1.3.tar.gz -o pypotrace-0.1.3.tar.gz
#tar xvf pypotrace-0.1.3.tar.gz
#rm pypotrace-0.1.3.tar.gz
cd pypotrace-0.1.3
/usr/bin/python setup.py build_ext --inplace
cd ../
pip install -e pypotrace-0.1.3
#git clone https://github.com/venicegeo/bfalg-ndwi.git
cd bfalg-ndwi
mkdir vendor
pip download -r requirements.txt -d ../../out
echo "done"

