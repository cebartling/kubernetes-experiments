#!/bin/zsh


helm delete kubernetes-experiments-01-admin-portal  --wait
helm delete kubernetes-experiments-01-portal --wait
helm delete kubernetes-experiments-01-api-server --wait
helm delete postgres --wait
helm delete redis-cluster --wait

kubectl get pods,deployments,services,statefulsets 

# delete the namespace
kubectl delete -f ./templates/kubernetes-experiments-01-namespace.yaml

kubectl get namespaces


