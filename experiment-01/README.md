# Kubernetes Experiments 1

## Kubernetes deployment

Ensure you have built and pushed all Docker images before deploying to Kubernetes.

1. Ensure the k8s context is set to the desired cluster.
    ```shell
    kubectl config current-context
    ```

   If the context is not set to the desired cluster, set it:
    ```shell
    kubectl config use-context <context-name>
   ```

   For example, to set the context to the local cluster:
    ```shell
    kubectl config use-context docker-desktop
   ```
   
2. Install nginx ingress controller:
    ```shell
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
    ```

3. Create the namespace, deployments and services in the k8s cluster:
    ```shell
    ./k8s/cluster-up.zsh
    ```

4. Check the pods, services and deployments:
    ```shell
    kubectl get pods,services,deployments --namespace=kubernetes-experiments-01
    ```
   
5. View the logs for the PostgreSQL pods:
    ```shell
    kubectl logs pod/postgres-0 --namespace=kubernetes-experiments-01
   
    kubectl logs pod/postgres-1 --namespace=kubernetes-experiments-01
    ```

6. Access the services:
    - Portal: http://localhost:32000
    - Admin Portal: http://localhost:32001

### Cleaning up the deployment

1. Delete the namespace, deployments and services:
    ```shell
   ./k8s/cluster-down.zsh
    ```

2. Ensure all objects are deleted:
    ```shell
   kubectl get pods,services,deployments --namespace=kubernetes-experiments-01    
   ```

## Debugging the Kubernetes deployment

### Describe the pods, services and deployments

```shell
kubectl describe deployment kubernetes-experiments-01-api-server --namespace=kubernetes-experiments-01

kubectl describe service kubernetes-experiments-01-api-server --namespace=kubernetes-experiments-01

kubectl describe pods,services,deployments --namespace=kubernetes-experiments-01
```

### Check the pod logs

```shell
kubectl logs kubernetes-experiments-01-api-server

kubectl logs kubernetes-experiments-01-portal

kubectl logs kubernetes-experiments-01-admin-portal
```
