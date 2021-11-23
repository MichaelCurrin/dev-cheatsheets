# doc

```
go doc
godoc
```

If both a library package and a command with the same name exists, using the prefix `cmd/` will force documentation on the command rather than the library package. 

If the `-src` flag is specified, it prints the exported interface of a package in Go source form, or the implementation of a specific exported language entity.


## Examples

```sh
godoc fmt                # For package fmt
godoc fmt Printf         # For fmt.Printf
godoc cmd/go             # Force documentation for the go command
godoc -src fmt           # fmt package interface in Go source form
godoc -src fmt Printf    # Implementation of fmt.Printf
```

Run a web server and present the documentation as a web page.

```sh
$ godoc -http=:8000
```
