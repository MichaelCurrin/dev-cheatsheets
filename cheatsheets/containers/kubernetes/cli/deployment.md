# Deployment

## List deployments

```sh
$ kubectl get deployments
```

## Get a deployment

```sh
$ kubectl get deployment DEPLOYMENT_NAME
```

```
NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
foobarb-backend-stg     2/2     2            2           2d18h
```

Optionally get as long YAML output as below.

```console
$ kubectl get deployment DEPLOYMENT_NAME -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "12"
    meta.helm.sh/release-name: foobar-backend-stg
    meta.helm.sh/release-namespace: marketing
  creationTimestamp: "2021-01-19T18:14:59Z"
  generation: 12
  ...
....
```

Optionally write to a local YAML file by adding this:

```sh
> foo.yaml
```


## Edit deployment

```sh
$ kubectl edit DEPLOYMENT_NAME
```

Then you'll get a text editor window which you can edit and save.


## Scale

Scale the number of pods up or down using `scale` subcommand.

Use a name from `kubectl get deployments` here and add a prefix.

```sh
$ kubectl scale deployments/NAME --replicas 2
```

e.g.

```sh
$ kubectl scale deployments/helloworld-dev --replicas 2
```
Output:
```
deployment.apps/helloworld-dev scaled
```

Or updating your config's replica count and apply the config.

```sh
$ kubectl apply -f myapp.yaml
```
