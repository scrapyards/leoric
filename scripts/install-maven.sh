#!/bin/bash

set -xe
export VER="3.6.3"
wget http://www-eu.apache.org/dist/maven/maven-3/${VER}/binaries/apache-maven-${VER}-bin.tar.gz
tar xvf apache-maven-${VER}-bin.tar.gz
sudo mv apache-maven-${VER} /opt/maven
