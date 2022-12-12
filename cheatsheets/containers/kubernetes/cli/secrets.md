# Secrets

- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) docs

## Get secret

Summary:

```sh
$ kubectl get secrets
```

Detailed:

```sh
$ kubectl get secret SECRET_NAME -o yaml
```
```sh
$ kubectl get secret SECRET_NAME -o json
```

## Create secret

```sh
$ kubectl create secret generic SECRET_NAME --from-file=username.txt --from-file=password.txt
```

```sh
$ kubectl create secret generic SECRET_NAME --from-literal=username=foo --from-literal=password='S!B\*d$zDsb'
```

## Edit

```sh
$ kubectl edit secrets SECRET_NAME
```

## Dump secrets

Create a YAML file for each secret available.

```sh
$ kubectl get --no-headers secret | \
    awk '{print $1}' | \
    xargs -I{} sh -c 'kubectl get secret -o yaml "$1" > "$1.yaml"' - {}
```
