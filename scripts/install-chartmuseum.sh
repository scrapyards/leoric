#!/bin/bash

set -xe
curl -LO https://s3.amazonaws.com/chartmuseum/release/latest/bin/linux/amd64/chartmuseum
chmod +x chartmuseum
sudo mv chartmuseum /usr/local/bin/chartmuseum
