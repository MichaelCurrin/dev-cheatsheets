# Context

## Get context

```console
$ kubectl config set-context
my-context
```


## Set context

```sh
$ kubectl config set-context my-context
```


## Namespace

You need to run commands in a namespace.

e.g.

```sh
$ kubectl get pods --namespace=my-namespace
```

Or set it globally for the context.

```sh
$ kubectl config set-context --current --namespace=my_namespace
```
