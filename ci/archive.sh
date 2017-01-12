#! /bin/bash -ex

pushd `dirname $0`/.. > /dev/null
root=$(pwd -P)
popd > /dev/null

export GOPATH=$root/gopath
mkdir -p $GOPATH $GOPATH/bin $GOPATH/src $GOPATH/pkg
source $root/ci/vars.sh

go get -v github.com/venicegeo/pzsvc-exec/...

src=$GOPATH/bin/pzsvc-exec
mv $src $root/$APP.$EXT
mv $src $root/pzsvc-taskworker.bin
