# One


## Install package in your project

```sh
$ go get GITHUB_INSTALL_REF
```

e.g.

```sh
$ go get github.com/lib/pq

$ go get github.com/isacikgoz/gitbatch/cmd/gitbatch
```

Precise version:

```sh
$ go get github.com/lib/pq@v1.8.0
```


## Upgrade package

Use the `-u` flag.

```sh
$ go get -u github.com/lib/pq
```

Latest patch release.

```sh
$ go get -u=patch github.com/lib/pq
```

Find available versions:

```sh
$ go list -m -versions github.com/lib/pq
```
```
github.com/lib/pq v1.0.0 v1.1.0 v1.1.1 ... ....
```


## Install a package globally

Provide a URL such as to a GitHub repo. Here using [MichaelCurrin/go-project-template](https://github.com/MichaelCurrin/go-project-template).

```sh
$ go install github.com/MichaelCurrin/go-project-template/cmd/myapp
```

If `GOBIN` is in your `PATH`, you can run from anywhere:

```sh
$ my-app -h
```
