#!/usr/bin/env bash

set -e -u

cd $(dirname $0)

mkdir $PWD/web
mkdir $PWD/worker

docker run -u $(id -u):$(id -g) --rm -v $PWD/web:/keys concourse/concourse \
  generate-key -t rsa -f keys/session_signing_key

docker run -u $(id -u):$(id -g) --rm -v $PWD/web:/keys concourse/concourse \
  generate-key -t ssh -f keys/tsa_host_key

docker run -u $(id -u):$(id -g) --rm -v $PWD/worker:/keys concourse/concourse \
  generate-key -t ssh -f keys/worker_key

cp $PWD/worker/worker_key.pub $PWD/web/authorized_worker_keys
cp $PWD/web/tsa_host_key.pub $PWD/worker