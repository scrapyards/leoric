#!/bin/bash
set -xe
curl -sL https://istio.io/downloadIstio | sh -
cd istio*
sudo cp bin/istioctl /usr/local/bin
