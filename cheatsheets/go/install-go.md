---
title: Install Go
description: Install and manage version of Go
---


## Install

[Install Go with a package manager](https://gist.github.com/ca6b3b955172ff993184d39807dd68d4)

<script src="https://gist.github.com/MichaelCurrin/ca6b3b955172ff993184d39807dd68d4.js"></script>

[Install Go binary manually](https://gist.github.com/5e2bafa7aa4895e56aeb489c91d314d4)

<script src="https://gist.github.com/MichaelCurrin/5e2bafa7aa4895e56aeb489c91d314d4.js"></script>


## Upgrade

Use your package manager's upgrade command.

For a manual install, you'll have to a file from the website or using the method below and then replace your `go` binary with another version.


## Manage multiple versions

From [Installing multiple Go versions ](https://golang.org/doc/manage-install#installing-multiple) section of install doc.

Use the `get` command once Go is installed to fetch another version. This will be added to your go packages directory and doesn't affect your core go.

```sh
$ go get golang.org/dl/go1.10.7
$ go1.10.7 download
```

Use it by using the version number in the command name.

```sh
$ go1.10.7 version
go version go1.10.7 linux/amd64
```
