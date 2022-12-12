
# Replica set

A new replicaset is created with each deploy and a history is saved. You’ll see 10 or so for each deployment:

```sh
$ kubectl get rs
```

To find which replicaset is active for the deployment, describe  the deployment and look for NewReplicaSet:

```sh
kubectl describe deploy my-pod-name | grep NewReplicaSet
```
