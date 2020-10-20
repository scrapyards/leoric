#!/bin/bash
set -e
VERSION=1.15.3
OS=linux-amd64

TEMPDIR=$(mktemp -d)
pushd $TEMPDIR
wget https://dl.google.com/go/go$VERSION.$OS.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go$VERSION.$OS.tar.gz
popd
rm -rf $TEMPDIR
