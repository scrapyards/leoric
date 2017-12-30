#!/usr/bin/env bash
set -xe

# go get -u github.com/cloudflare/cfssl/cmd/cfssl
# go get -u github.com/cloudflare/cfssl/cmd/cfssljson

# Make sure $GOPATH/bin is in PATH so we can exec cfssl
# This generates the CA for everything else
cfssl gencert -initca ca-csr.json | cfssljson -bare ca

for f in csrs/*-csr.json; do
  filename=$(echo $f | awk -F/ '{print $2}')
  name=$(echo $filename | sed -e s/-csr.json$//)
  profile="server"
  temp=$(echo $name | tr /a-z/ /A-Z/)
  if [[ $temp  == *"CLIENT"* ]]; then
    profile="client"
  fi
  cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json \
    -profile=$profile $f | cfssljson -bare $name
done
