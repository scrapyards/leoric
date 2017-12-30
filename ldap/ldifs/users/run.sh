#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Invalid number of arguments."
    echo "Usage: $0 <firstName> <lastName> <description>"
    exit 1
fi

filename=$(echo "$1-$2" | awk '{print tolower($0)}')

# apriori install: https://github.com/pbertera/jinja2-cli
# i.e., run: ``pip install jinja2-cli``
jinja2 \
  --format=querystring \
  -D firstname=$1 \
  -D lastname=$2 \
  -D enc_password=$(slappasswd -s $2) \
  -D description=$3 \
  user.ldif.j2 | tee ${filename}.ldif
