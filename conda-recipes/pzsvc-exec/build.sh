#!/bin/bash

export GOPATH=$PREFIX
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
go get github.com/venicegeo/pzsvc-exec/...

