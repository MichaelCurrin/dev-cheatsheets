# exec

## Interactive

```sh
$ kubectl exec -it POD_NAME -- bash
```

## Run command

e.g. Running a Postgres dump command and writing the file.

```sh
$ kubectl exec -it POD_NAME -- bash -c 'ls > my_files.txt'
```

