#!/bin/sh

set -eu

VERSION=$(git describe | sed 's/^v//')
IMAGE=ghcr.io/nyu-rts/k8s-emailer:$VERSION

docker buildx build --pull \
    . \
    --cache-from type=registry,ref=ghcr.io/remram44/k8s-emailer/buildxcache \
    --cache-to type=registry,mode=max,ref=ghcr.io/remram44/k8s-emailer/buildxcache,oci-mediatypes=false \
    --platform linux/amd64,linux/arm64 \
    --push --tag $IMAGE

echo
echo "    $IMAGE"
