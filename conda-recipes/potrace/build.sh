#!/bin/bash

mkdir -vp ${PREFIX}/bin;
chmod +x configure;

./configure --prefix=${PREFIX} --with-libpotrace || return 1;
make || return 1;
make install || return 1;

