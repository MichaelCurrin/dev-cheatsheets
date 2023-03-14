# Context

## Get context

```console
$ kubectl config current-context
my-context
```


```console
$ kubectl config get-contexts
CURRENT   NAME               CLUSTER            AUTHINFO                             NAMESPACE
...
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
$ kubectl config set-context --current --namespace=my-namespace
```
