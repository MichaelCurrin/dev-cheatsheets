# Kubernetes cheatsheet

Also known as "K8s" for short.

- [kubernetes.io](https://kubernetes.io) homepage.
- [Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/) on Kubernetes homepage.

Example values:

- SERVICE_NAME: foo
- PODNAME: foo-0f4988689-l5hfa


## Services

```sh
kubectl get services
```

Get external IP for a service.

```sh
kubectl get service SERVICE_NAME
```
Fields:
```
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP                                                               PORT(S)         AGE
```

Or use `svc` for `service` above.


Create service

```sh
kubectl apply -f SERVICE_YAML_FILE
```

## Pods

List.

```sh
kubectl get pods

kubectl get pods --all-namespaces
```

Describe config.

```sh
kubectl describe pod POD_NAME
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

Get a deployment. Optionally get as YAML as below. Optionally write to a local YAML file.

```sh
kubectl get deployment NAME -o yaml
```

## Secrets

```sh
kubectl get secrets
```

```sh
kubectl get secret SECRET_NAME -o yaml
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0MTYxNDk1OTgsMTUzODE3MDQ3OSwtMT
YyNDM4MDM1OF19
-->