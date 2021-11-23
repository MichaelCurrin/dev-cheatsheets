# tail


## End of file

Get the last 10 lines of a file.

```sh
$ tail file.txt
```

Get the last 100 lines of a file.

```sh
$ tail -n 100 file.txt
```


## Follow

This command will watch continuously for output and not exit.

```sh
$ tail -f
```

Or

```sh
$ tail -f > /dev/null
```


## Selection

Get lines 300 to 450 of a file.

```sh
$ head -n 450 file.txt | tail -n 150
```
