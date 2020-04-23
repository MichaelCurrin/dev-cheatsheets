# Kubernetes cheatsheet

Also known as "K8s" for short.

- [kubernetes.io](https://kubernetes.io) homepage.
- [Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/) on Kubernetes homepage.

Example values:

- SERVICE_NAME: `foo`
- PODNAME: `foo-0f4988689-l5hfa`


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
kubectl exec -it POD COMMAND
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

- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) docs

### Get secret

```sh
kubectl get secrets
```

```sh
kubectl get secret SECRET_NAME -o yaml
```

### Create secret

```sh
kubectl create secret generic SECRET_NAME --from-file=username.txt --from-file=password.txt
```

```sh
kubectl create secret generic SECRET_NAME --from-literal=username=foo --from-literal=password='S!B\*d$zDsb'
```

### Edit

```sh
kubectl edit secrets SECRET_NAME
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc1Njk1MzkxMiwtMTg1NzkxMzkzMiwxNT
M4MTcwNDc5LC0xNjI0MzgwMzU4XX0=
-->