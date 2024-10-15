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
   
2. Create the namespace for the deployment:
    ```shell
    kubectl apply -f ./k8s/templates/kubernetes-experiments-01-namespace.yaml
    ```
   Then check the namespace:
    ```shell
    kubectl get namespaces
    ```
   
3. Apply the pod files:
    ```shell
    kubectl apply -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-pod.yaml
    kubectl apply -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-service.yaml
   
    kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-pod.yaml
    kubectl apply -f ./k8s/templates/portal/kubernetes-experiments-01-portal-service.yaml
   
    kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-pod.yaml
    kubectl apply -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-service.yaml
    ```
4. Ensure the pods start up correctly:
    ```shell
    kubectl get pods
    ```
5. Check the logs of each pod:
    ```shell
    kubectl logs kubernetes-experiments-01-api-server

    kubectl logs kubernetes-experiments-01-portal
   
    kubectl logs kubernetes-experiments-01-admin-portal
    ```

6. Check the services:
    ```shell
    kubectl get services
    ```
   
7. Access the services:
    - Portal: http://localhost:32000
    - Admin Portal: http://localhost:32001


### Cleaning up the deployment

1. Delete the pods:
    ```shell
    kubectl delete -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-service.yaml
    kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-service.yaml
    kubectl delete -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-service.yaml
    kubectl delete -f ./k8s/templates/api-server/kubernetes-experiments-01-api-server-pod.yaml
    kubectl delete -f ./k8s/templates/portal/kubernetes-experiments-01-portal-pod.yaml
    kubectl delete -f ./k8s/templates/admin-portal/kubernetes-experiments-01-admin-portal-pod.yaml
    ```
   
2. Ensure the pods are deleted:
    ```shell
    kubectl get pods
   
    kubectl get services
    ```

