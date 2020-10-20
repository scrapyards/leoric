#!/bin/bash
#VERSION=2.16.10
VERSION=3.3.4
OS=linux-amd64

TEMPDIR=$(mktemp -d)
cd $TEMPDIR
wget https://get.helm.sh/helm-v$VERSION-$OS.tar.gz
tar xpvzf helm-v$VERSION-$OS.tar.gz
chmod +x $OS/helm
sudo mv $OS/helm /usr/local/bin/helm-$VERSION
cd
rm -rf $TEMPDIR
