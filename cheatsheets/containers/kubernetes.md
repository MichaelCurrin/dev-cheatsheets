# Kubernetes cheatsheet

Also known as "K8s".

- [kubernetes.io](https://kubernetes.io)
- [Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

## Services

```sh
``
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

List deployments.

```sh
kubectl get deployments
```

Get a deployment. Optionally get as YAML as below. Optionally write to a local YAML fil.e

```sh
kubectl get deployment NAME -o yaml
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjE0MzE2NDUwNl19
-->