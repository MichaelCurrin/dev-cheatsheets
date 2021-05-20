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

If using a package manager - use your package manager's upgrade command.

For a manual install - download to a file from the website as above. Or use the multip versions approach below.


## Manage multiple versions

From [Installing multiple Go versions ](https://golang.org/doc/manage-install#installing-multiple) section of install doc.

Use the `get` command once Go is installed to fetch another version. This will be added to your Go packages directory and doesn't affect your core Go.

```sh
$ go get golang.org/dl/go1.10.7
$ go1.10.7 download
```

Use it by using the version number in the command name.

- Extra Go.
    ```sh
    $ go1.10.7 version
    go version go1.10.7 linux/amd64
    ```
- Core Go.
    ```sh
    $ go version go1.15.2 darwin/amd64
    ```
