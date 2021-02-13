# install

Use `-v` verbose flag to see the install location.


## Usage

This will compile the app and add it to your `GOBIN` directory, so you can run it anywhere.

```sh
$ go install
```

That is the same as doing this:

```sh
$ go build -o ~/go/bin/myapp cmd/myapp/main.go
```
