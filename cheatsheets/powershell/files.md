# Files

## Write to a file

```sh
COMMAND | Set-Content -Path OUT_PATH
```

e.g.

```sh
kubectl logs my-pod | Set-Content -Path my-log.txt
```
