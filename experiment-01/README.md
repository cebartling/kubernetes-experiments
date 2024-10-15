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
2. Apply the pod files:
    ```shell
    kubectl apply -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-pod.yaml
   
    kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-pod.yaml
    kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-service.yaml
   
    kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-pod.yaml
    kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-service.yaml
    ```
3. Ensure the pods start up correctly:
    ```shell
    kubectl get pods
    ```
4. Check the logs of each pod:
    ```shell
    kubectl logs kubernetes-experiments-01-api-server

    kubectl logs kubernetes-experiments-01-portal
   
    kubectl logs kubernetes-experiments-01-admin-portal
    ```
5. Set up port forwarding to the pod:
    ```shell
    kubectl port-forward kubernetes-experiments-01-api-server 8082:3000
    ```

### Cleaning up the deployment

1. Delete the pods:
    ```shell
    kubectl delete -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-pod.yaml
    kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-pod.yaml
    kubectl delete -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-pod.yaml
    ```
   
2. Ensure the pods are deleted:
    ```shell
    kubectl get pods
    ```

