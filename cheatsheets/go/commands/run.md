# run

Execute a script without explicitly building it first.

Given script `cli/myapp/main.go`.

Run it like this:

```sh
$ go run cli/myapp/main.go
```

That seems to run these steps internally:

```sh
$ go install
$ # Or 
$ go build -o $GOBIN/myapp

$ myapp
```

Note the name of the directory is used and not the script name.
