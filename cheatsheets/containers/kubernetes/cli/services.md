# Services

```sh
$ kubectl get services
$ kubectl get svc
```

Sample ouput:

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
