#!/bin/bash

VERSION=2.7.2
OS=linux-amd64

TEMPDIR=$(mktemp -d)
pushd $TEMPDIR
curl -sSL -o /usr/local/bin/argo https://github.com/argoproj/argo/releases/download/v${VERSION}/argo-${OS}
chmod +x /usr/local/bin/argo
popd
rm -rf $TEMPDIR
