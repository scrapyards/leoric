#!/bin/bash
set -xe

TEMPDIR=$(mktemp -d)
pushd $TEMPDIR
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo cp -f minikube /usr/local/bin/minikube
popd
rm -rf $TEMPDIR
