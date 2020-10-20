#!/bin/bash

set -xe

git fetch upstream
git checkout master
git merge upstream/master
git push
