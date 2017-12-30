#!/usr/bin/env bash
set -xe

# go get -u github.com/cloudflare/cfssl/cmd/cfssl
# go get -u github.com/cloudflare/cfssl/cmd/cfssljson

# Make sure $GOPATH/bin is in PATH so we can exec cfssl
# This generates the CA for everything else
cfssl gencert -initca ca-csr.json | cfssljson -bare ca

# Docker certs
# for elem in server client; do
#   cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json \
#     -profile=$elem docker-$elem-csr.json | cfssljson -bare docker-$elem
# done
