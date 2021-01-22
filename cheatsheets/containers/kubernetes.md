---
description: The tool that lets you manage and deploy pods of containers at scale
logo: kubernetes
---
# Kubernetes


Also known as "k8s" for short (since the name is 8 letters long)

- [kubernetes.io](https://kubernetes.io) homepage.
- [Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/) on Kubernetes homepage.

Example values for commands below.

- `SERVICE_NAME` and `DEPLOYMENT_NAME` -  `foobarb`
- `PODNAME` - `foo-0f4988689-l5hfa`


## Services

```sh
$ kubectl get services
$ kubectl get svc
```

```
NAME                    TYPE           CLUSTER-IP       EXTERNAL-IP            PORT(S)                      AGE
foobarb-backend-dev      ClusterIP      10.100.104.121   <none>                5000/TCP                     164d
foobarb-backend-stg      ClusterIP      10.100.218.0     <none>                5000/TCP                     164d
...
```

Get external IP for a service.

```sh
$ kubectl get service SERVICE_NAME
```
Fields:
```
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP                                                               PORT(S)         AGE
```

Or use `svc` for `service` above.


Create service

```sh
$ kubectl apply -f SERVICE_YAML_FILE
```


## Pods

List.

```sh
$ kubectl get pods
$ kubectl get pods --all-namespaces
```

```
NAME                                     READY   STATUS    RESTARTS   AGE
foobarb-backend-dev-abcdc7fdb5-wdhl4      1/1     Running   0          46h
foobarb-backend-stg-abcd549c97-d8jn6      1/1     Running   0          14d
...
```

Describe in long detail. Using `pods` for `pod` also works.

```sh
$ kubectl describe pod POD_NAME
```

```
Name:         foobarb-backend-stg-abcd549c97-d8jn6
Namespace:    ...
Priority:     0
Node:         ip-...
Start Time:   Thu, 21 Jan 2021 21:16:30 +0200
Labels:       ...
...
```

Start tunnel in a pod using a command use `/bin/sh`, `/bin/bash`, `postgresql` or `python3`.

```sh
$ kubectl exec -it POD COMMAND
```


## Deployment

List deployments.

```sh
$ kubectl get deployments
```

Get a deployment.

```sh
$ kubectl get deployment DEPLOYMENT_NAME
```

```
NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
foobarb-backend-stg     2/2     2            2           2d18h
```

Get a deployment. Optionally get as long YAML output as below. Optionally write to a local YAML file.

```sh
$ kubectl get deployment DEPLOYMENT_NAME -o yaml  # > foo.yaml
```

```
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "12"
    meta.helm.sh/release-name: foobarb-backend-stg
    meta.helm.sh/release-namespace: marketing
  creationTimestamp: "2021-01-19T18:14:59Z"
  generation: 12
  ...
....
```


## Secrets

- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) docs

### Get secret

```sh
$ kubectl get secrets
```

```sh
$ kubectl get secret SECRET_NAME -o yaml
```

### Create secret

```sh
$ kubectl create secret generic SECRET_NAME --from-file=username.txt --from-file=password.txt
```

```sh
$ kubectl create secret generic SECRET_NAME --from-literal=username=foo --from-literal=password='S!B\*d$zDsb'
```

### Edit

```sh
$ kubectl edit secrets SECRET_NAME
```

### Dump secrets

Create a YAML file for each secret available.

```sh
$ kubectl get --no-headers secret | \
    awk '{print $1}' | \
    xargs -I{} sh -c 'kubectl get secret -o yaml "$1" > "$1.yaml"' - {}
```


##  Man page

```sh
$ kubectl --help
```
```
kubectl controls the Kubernetes cluster manager.

 Find more information at: https://kubernetes.io/docs/reference/kubectl/overview/

Basic Commands (Beginner):
  create         Create a resource from a file or from stdin.
  expose         Take a replication controller, service, deployment or pod and expose it as a new Kubernetes Service
  run            Run a particular image on the cluster
  set            Set specific features on objects

Basic Commands (Intermediate):
  explain        Documentation of resources
  get            Display one or many resources
  edit           Edit a resource on the server
  delete         Delete resources by filenames, stdin, resources and names, or by resources and label selector

Deploy Commands:
  rollout        Manage the rollout of a resource
  scale          Set a new size for a Deployment, ReplicaSet, Replication Controller, or Job
  autoscale      Auto-scale a Deployment, ReplicaSet, or ReplicationController

Cluster Management Commands:
  certificate    Modify certificate resources.
  cluster-info   Display cluster info
  top            Display Resource (CPU/Memory/Storage) usage.
  cordon         Mark node as unschedulable
  uncordon       Mark node as schedulable
  drain          Drain node in preparation for maintenance
  taint          Update the taints on one or more nodes

Troubleshooting and Debugging Commands:
  describe       Show details of a specific resource or group of resources
  logs           Print the logs for a container in a pod
  attach         Attach to a running container
  exec           Execute a command in a container
  port-forward   Forward one or more local ports to a pod
  proxy          Run a proxy to the Kubernetes API server
  cp             Copy files and directories to and from containers.
  auth           Inspect authorization

Advanced Commands:
  diff           Diff live version against would-be applied version
  apply          Apply a configuration to a resource by filename or stdin
  patch          Update field(s) of a resource using strategic merge patch
  replace        Replace a resource by filename or stdin
  wait           Experimental: Wait for a specific condition on one or many resources.
  convert        Convert config files between different API versions
  kustomize      Build a kustomization target from a directory or a remote url.

Settings Commands:
  label          Update the labels on a resource
  annotate       Update the annotations on a resource
  completion     Output shell completion code for the specified shell (bash or zsh)

Other Commands:
  api-resources  Print the supported API resources on the server
  api-versions   Print the supported API versions on the server, in the form of "group/version"
  config         Modify kubeconfig files
  plugin         Provides utilities for interacting with plugins.
  version        Print the client and server version information

Usage:
  kubectl [flags] [options]

Use "kubectl <command> --help" for more information about a given command.
Use "kubectl options" for a list of global command-line options (applies to all commands).
```
