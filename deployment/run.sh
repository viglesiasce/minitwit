#!/bin/bash -xe
apt-get update
apt-get install -y python-pip
pip install https://github.com/mitsuhiko/flask/tarball/master
pip install -U pytest argparse

if [ ! -d "/vagrant" ]; then
  apt-get install -y git
  git clone https://github.com/viglesiasce/minitwit /vagrant
fi

pushd /vagrant
rm -rf __pycache__
flask --app=minitwit initdb
flask --app=minitwit run -h 0.0.0.0
