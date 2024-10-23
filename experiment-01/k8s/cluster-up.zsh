#!/bin/zsh

# This script is used to bring up the k8s cluster
# It is used to create the namespace, pods and services

# Apply the namespace
kubectl apply -f ./templates/kubernetes-experiments-01-namespace.yaml

helm install postgres ./postgresql/postgres-0.0.1.tgz
helm install redis-cluster ./redis/redis-0.0.1.tgz
helm install kubernetes-experiments-01-api-server ./api-server/kubernetes-experiments-01-api-server-0.0.1.tgz
helm install kubernetes-experiments-01-portal ./portal/kubernetes-experiments-01-portal-0.0.1.tgz
helm install kubernetes-experiments-01-admin-portal ./admin-portal/kubernetes-experiments-01-admin-portal-0.0.1.tgz

kubectl get pods,services,deployment,statefulset --namespace=kubernetes-experiments-01

