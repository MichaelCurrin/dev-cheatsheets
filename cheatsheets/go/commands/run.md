# run

Execute a script. This will compile/build it first for you.


## Basic

Given script `main.go`.

Run it like this:

```sh
$ go run main.go
```


## CLI

Given script `cli/myapp/main.go`.

Run it like this:

```sh
$ go run cli/myapp/main.go
```

Or even:

```sh
$ go run ./...
```

But if there are multiple matches you'll get an error.

```sh
$ go run ./...
```
```
go run: pattern ./... matches multiple packages:
        github.com/MichaelCurrin/go-project-template
        github.com/MichaelCurrin/go-project-template/cmd/myapp
```
