#!/bin/sh
TAG=$(git describe | sed 's/^v//')
helm package --version $TAG --app-version $TAG helm
helm push k8s-emailer-$TAG.tgz oci://ghcr.io/remram44/k8s-emailer/helm-charts
