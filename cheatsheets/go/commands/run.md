# run

Execute a script without explicitly building it first.

Given script `cli/myapp/main.go`.

Run it like this:

```sh
$ go run cli/myapp/main.go
```

That runs these two steps internally:

```sh
$ go build -o ~/go/bin/myapp
$ ./myapp
```

Or where your Go bin directory is.
