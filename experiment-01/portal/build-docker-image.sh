#!/usr/bin/env sh

npm run build-docker
docker tag k8s-experiments-01-portal:latest cebartling/k8s-experiments-01-portal:latest
docker push cebartling/k8s-experiments-01-portal:latest