#!/bin/zsh

# This script is used to bring up the k8s cluster
# It is used to create the namespace, pods and services

# Apply the namespace
kubectl apply -f ./templates/kubernetes-experiments-02-namespace.yaml

#helm install kubernetes-experiments-02-sample-app ./sample-app/kubernetes-experiments-02-sample-app-0.0.1.tgz

kubectl get pods,services,deployment,statefulset --namespace=kubernetes-experiments-02

