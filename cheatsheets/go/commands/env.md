# env

Go uses a lot of environment variables which are used within Go. 

But not available in your global environment by default - such as with running`env` in the shell.


## All variables

```sh
$ go env
```

```
GO111MODULE=""
GOARCH="amd64"
GOBIN=""
GOCACHE="/Users/mcurrin/Library/Caches/go-build"
...
```


## Show ariable

```sh
$ go env GOPATH
```

```
/Users/mcurrin/go
```
