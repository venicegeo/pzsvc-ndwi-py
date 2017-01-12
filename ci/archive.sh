#! /bin/bash -ex

pushd `dirname $0`/.. > /dev/null
root=$(pwd -P)
popd > /dev/null

export GOPATH=$root/gopath
mkdir -p $GOPATH $GOPATH/bin $GOPATH/src $GOPATH/pkg
source $root/ci/vars.sh

go get -v github.com/venicegeo/pzsvc-exec/...
go get -v github.com/venicegeo/pzsvc-exec/pzsvc-taskworker/...

mv $GOPATH/bin/pzsvc-exec $root/$APP.bin
mv $GOPATH/bin/pzsvc-taskworker $root/pzsvc-taskworker.bin

cd $root

tar cvzf $APP.$EXT \
    pzsvc-taskworker.bin \
    $APP.bin
tar tzf $APP.$EXT