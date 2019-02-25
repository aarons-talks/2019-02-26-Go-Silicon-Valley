#!/bin/bash

# ALL THE PUNS

# start up a "VM"
docker run -it -v $PWD:/hugo -w /hugo -it golang:1.11 bash

# where is the GOPATH? we aint in it
echo $GOPATH

# we don't need git y'all
rm $(which git)

# yea, it's gone I swear
git

# let's talk (to the Athens server)
export GOPROXY=https://athens.azurefd.net

# put a jacket on it, it's cold (in the local cache)
ls -al $GOPATH/pkg/mod

# get your tools cuz we're buildin' yall
go build

# now the cache is all cozy
ls -al $GOPATH/pkg/mod

# IT WORKED!
./hugo
