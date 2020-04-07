# Kubernetes cheatsheet

Also known as "K8s".

- [kubernetes.io](https://kubernetes.io)
- [Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

## Services

```sh
kubectl get svc NAME
```
Create service

```sh
kubectl apply -f FILE.yaml
```

## Pods

List.

```sh
kubectl get pods

kubectl get pods --all-namespaces
```

Describe.

```sh
kubectl describe pods NAME
```


Start tunnel in a pod using a command use `/bin/sh`, `/bin/bash`, `postgresql` or `python3`.

```sh
kubectl exec -it NAME COMMAND
```


## Deployment

kubectl get deployment NAME -o yaml

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY5Njk5NjQxNF19
-->