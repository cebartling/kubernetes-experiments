#!/bin/zsh

# This script is used to bring down the k8s cluster
# It is used to delete the namespace, pods and services

# Delete the pods and services
kubectl delete -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-pod.yaml
kubectl delete -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-service.yaml

kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-pod.yaml
kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-service.yaml

kubectl delete -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-pod.yaml
kubectl delete -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-service.yaml

kubectl get pods,services --namespace=kubernetes-experiments-01

# delete the namespace
kubectl delete -f ./k8s/templates/kubernetes-experiments-01-namespace.yaml

kubectl get namespaces


