#!/bin/zsh

# This script is used to bring up the k8s cluster
# It is used to create the namespace, pods and services

# Apply the namespace
kubectl apply -f ./k8s/templates/kubernetes-experiments-01-namespace.yaml

# Build out PostgreSQL
kubectl apply -f ./k8s/templates/postgresql/postgresql-configmap.yaml
kubectl apply -f ./k8s/templates/postgresql/postgresql-secret.yaml
kubectl apply -f ./k8s/templates/postgresql/postgresql-statefulset.yaml
kubectl apply -f ./k8s/templates/postgresql/postgresql-service.yaml

# Build out Redis
kubectl apply -f ./k8s/templates/redis/redis-configmap.yaml
kubectl apply -f ./k8s/templates/redis/redis-statefulset.yaml
kubectl apply -f ./k8s/templates/redis/redis-service.yaml

# Apply the pods and services
kubectl apply -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-deployment.yaml
kubectl apply -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-service.yaml

kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-deployment.yaml
kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-service.yaml
kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-ingress.yaml

#kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-deployment.yaml
#kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-service.yaml
#kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-ingress.yaml

kubectl get pods,services,deployment,statefulset --namespace=kubernetes-experiments-01