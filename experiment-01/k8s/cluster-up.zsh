#!/bin/zsh

# This script is used to bring up the k8s cluster
# It is used to create the namespace, pods and services

# Apply the namespace
kubectl apply -f ./k8s/templates/kubernetes-experiments-01-namespace.yaml

# Apply the pods and services
kubectl apply -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-deployment.yaml
kubectl apply -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-service.yaml

kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-deployment.yaml
kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-service.yaml

kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-pod.yaml
kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-service.yaml

kubectl get pods,services --namespace=kubernetes-experiments-01