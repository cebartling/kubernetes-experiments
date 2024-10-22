#!/bin/zsh

# This script is used to bring down the k8s cluster
# It is used to delete the namespace, pods and services

# Delete the pods and services
#kubectl delete -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-deployment.yaml
#kubectl delete -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-service.yaml

#kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-deployment.yaml
#kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-service.yaml
#kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-ingress.yaml

cd ./admin-portal || exit
helm uninstall kubernetes-experiments-01-admin-portal-0.0.1.tgz --namespace=kubernetes-experiments-01
cd ..


# Remove Redis
#kubectl delete -f ./k8s/templates/redis/redis-service.yaml
#kubectl delete -f ./k8s/templates/redis/redis-statefulset.yaml
#kubectl delete -f ./k8s/templates/redis/redis-configmap.yaml

# Remove PostgreSQL
#kubectl delete -f ./k8s/templates/postgresql/postgresql-service.yaml
#kubectl delete -f ./k8s/templates/postgresql/postgresql-statefulset.yaml
#kubectl delete -f ./k8s/templates/postgresql/postgresql-secret.yaml
#kubectl delete -f ./k8s/templates/postgresql/postgresql-configmap.yaml

kubectl get pods,deployments,services,statefulsets --namespace=kubernetes-experiments-01

# delete the namespace
kubectl delete -f ./templates/kubernetes-experiments-01-namespace.yaml

kubectl get namespaces


