#!/bin/bash

sed -i 's:  -L@x_libraries@::' src/platform/X11/Makefile.am &&
sed -i '/^AM_C_PROTOTYPES/d'   configure.in                 &&

bash autogen.sh --prefix=${PREFIX} --disable-static &&
make
make install
