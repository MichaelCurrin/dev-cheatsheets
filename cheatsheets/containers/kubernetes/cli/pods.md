
# Pods

List posts.

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

View logs in a pod. Use `-f` to update continuously. Like using `tail -f` locally on a log file.

```sh
kubectl logs -f foobarb-backend-stg-abcd549c97-d8jn6
```

Start tunnel in a pod. Pass a command use `sh`, `/bin/sh`, `/bin/bash`, `postgresql` or `python3`.

```sh
$ kubectl exec -it POD -- COMMAND
```

e.g.

```sh
$ kubectl exec -it foobarb-backend-stg-abcd549c97-d8jn6 -- sh
```

Note:

> `kubectl exec [POD] [COMMAND]` is DEPRECATED and will be removed in a future version. Use `kubectl exec [POD] -- [COMMAND]` instead.
