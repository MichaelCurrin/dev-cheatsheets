# gofmt

Docs: [gofmt](https://golang.org/cmd/gofmt/) command.


## Usage

```
gofmt [flags] [path ...]
```

Update file in place.

```sh
$ gofmt -w hello.go
```


## Help

```sh
$ gofmt -h
```

```
usage: gofmt [flags] [path ...]
  -cpuprofile string
        write cpu profile to this file
  -d    display diffs instead of rewriting files
  -e    report all errors (not just the first 10 on different lines)
  -l    list files whose formatting differs from gofmt's
  -r string
        rewrite rule (e.g., 'a[b:len(a)] -> a[b:]')
  -s    simplify code
  -w    write result to (source) file instead of stdout
```
