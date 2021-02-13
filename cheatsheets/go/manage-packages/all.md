---
title: All
description: Manage all your project's dependecies together
---


## Install all

Install packages needed by your scripts.

This will update your `go.mod` file if needed.

```sh
$ go get ./...
```

```
go: finding module for package github.com/shurcooL/githubv4
go: finding module for package golang.org/x/oauth2
go: found github.com/shurcooL/githubv4 in github.com/shurcooL/githubv4 v0.0.0-20201206200315-234843c633fa
go: found golang.org/x/oauth2 in golang.org/x/oauth2 v0.0.0-20210210192628-66670185b0cd
go: finding module for package github.com/shurcooL/graphql
go: found github.com/shurcooL/graphql in github.com/shurcooL/graphql v0.0.0-20200928012149-18c5c3165e3a
```

Sample result in `go.mod`:

```go
require (
	github.com/shurcooL/githubv4 v0.0.0-20201206200315-234843c633fa
	github.com/shurcooL/graphql v0.0.0-20200928012149-18c5c3165e3a // indirect
	golang.org/x/oauth2 v0.0.0-20210210192628-66670185b0cd
)
```

On repeat runs, it will output nothing if there was thing to download.

The dot slash and ellipsis allows picking up from subdirectories. If you only have a script at the top-level, then this is fine:

```sh
$ go get
```


## Install by running

Run on of these. Packages will be installed and `go.mod` will be updated.

```sh
$ go build hello.go
$ go run hello.go
$ go test hello.go
```


## Lock indirect packages

This will lock indirect packages.

```sh
$ go get all
```

Sample result in `go.mod`:

```go
require (
	github.com/golang/protobuf v1.4.3 // indirect
	github.com/google/go-cmp v0.5.4 // indirect
	github.com/shurcooL/githubv4 v0.0.0-20201206200315-234843c633fa
	github.com/shurcooL/graphql v0.0.0-20200928012149-18c5c3165e3a // indirect
	golang.org/x/net v0.0.0-20210119194325-5f4716e94777 // indirect
	golang.org/x/oauth2 v0.0.0-20210210192628-66670185b0cd
	google.golang.org/appengine v1.6.7 // indirect
)
```


## Upgrade all packages

Use `-u` to upgrade. This also seems to add indirect packages which weren't there before.

```sh
$ go get -u
```

```
go: google.golang.org/appengine upgrade => v1.6.7
go: github.com/golang/protobuf upgrade => v1.4.3
go: google.golang.org/protobuf upgrade => v1.25.0
go: golang.org/x/net upgrade => v0.0.0-20210119194325-5f4716e94777
go: golang.org/x/oauth2 upgrade => v0.0.0-20210210192628-66670185b0cd
```

Sample result in `go.mod`:

```go
require (
	github.com/golang/protobuf v1.4.3 // indirect
	github.com/shurcooL/githubv4 v0.0.0-20201206200315-234843c633fa
	github.com/shurcooL/graphql v0.0.0-20200928012149-18c5c3165e3a // indirect
	golang.org/x/net v0.0.0-20210119194325-5f4716e94777 // indirect
	golang.org/x/oauth2 v0.0.0-20210210192628-66670185b0cd
	google.golang.org/appengine v1.6.7 // indirect
)
```


## List packages

```sh
$ go list -m all
```


## Remove unused dependencies

```sh
$ go mod tidy
```
