# Logs

```sh
$ kubectl get logs POD_ID
```

For example

1. Use `kubectl get pods` to get a pod's ID (which changes on running a deploy).
1. Then run:
    ```sh
    $ kubectl get logs foobarb-backend-stg-abcd55cdc4-7qqxz
    ```
