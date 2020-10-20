#!/bin/bash

VERSION=1.3.4
wget https://github.com/containerd/containerd/releases/download/v$VERSION/containerd-$VERSION.linux-amd64.tar.gz
tar xvf containerd-$VERSION.linux-amd64.tar.gz
sudo mv bin/* /usr/local/bin
rm -rf bin containerd*.tar.gz
