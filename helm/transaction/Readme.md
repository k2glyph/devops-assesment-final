# helm Install and Upgrade
```
$ cd helm/transaction/
$ helm upgrade transaction -n testing --install .
Release "transaction" has been upgraded. Happy Helming!
NAME: transaction
LAST DEPLOYED: Tue Apr  1 23:21:23 2025
NAMESPACE: testing
STATUS: deployed
REVISION: 23
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace testing -l "app.kubernetes.io/name=transaction,app.kubernetes.io/instance=transaction" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace testing $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace testing port-forward $POD_NAME 8080:$CONTAINER_PORT
```


# Application status

```
$ kubectl get pods -n testing
NAME                          READY   STATUS    RESTARTS      AGE
transaction-8d7fc5d7c-6rhnn   0/1     Pending   0             20m
transaction-8d7fc5d7c-8vgxs   1/1     Running   1 (19m ago)   20m
transaction-8d7fc5d7c-fbkb2   0/1     Pending   0             20m
transaction-8d7fc5d7c-st8r4   0/1     Pending   0             20m
transaction-8d7fc5d7c-v8vz4   0/1     Pending   0             20m
transaction-postgresql-0      1/1     Running   0             20m
```

#### Note: Only one application running here because i have only one node in this cluster.

# Port Forwarding and testing
```
$ kubectl port-forward -n testing svc/transaction 8081:8080
Forwarding from 127.0.0.1:8081 -> 8080
Forwarding from [::1]:8081 -> 8080
Handling connection for 8081
```
```
$ curl http://localhost:8081/health
{"status":"healthy"}

