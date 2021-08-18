# gofmt

For general use, use should probably use [go fmt][]. If you need more control, use `gofmt`.

See [gofmt command][] docs.


## Usage

```
gofmt FLAGS PATHS
```

### Path:

- Supply a module name like `hello.go`.
- Use current directory as `.` - this works _recursively_.
- You cannot use `./...` here, but you can for [go fmt][].
- If you omit path, then it reads on stdin.


## Help

```console
$ gofmt -h
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

Flags must come before paths.


## Examples

### Check

Check what changes would be applied by using no flags. Output is printed to stdout - the _entire_ file will be printed so this will be noisy.

```sh
$ gofmt hello.go
```

### Patch

To see a patch of changes with `+` and `-` signs, add this flag:

```sh
$ gofmt -d hello.go
```

Sample result:

```
diff -u main.go.orig main.go
--- main.go.orig        2021-02-15 12:00:26.000000000 +0200
+++ main.go     2021-02-15 12:00:26.000000000 +0200
@@ -17,28 +17,28 @@
 
 func main() {
        app :=
-       &cli.App{
-               Name:        "GitHub GQL Tool",
-               HelpName:        "ghgql",
-               Usage:       "Provide a GQL query to read and a JSON path to write to. Required env variable: GH_TOKEN",
-               UsageText:   "ghgql [-h] [-v]",
-               Version:     VERSION,
-               Description: "Query the GitHub GQL API and return data as JSON",
+               &cli.App{
+                       Name:        "GitHub GQL Tool",
...
```

### List

List names of files to fix, without updating them.

```console
$ gofmt -l .
internal/greetings.go
main.go
```

Returns a success message even if changes are needed.

If there are no fixes needed, output will be empty.

### Update

Fix a file in place.

```sh
$ gofmt -w hello.go
```

Fix multiple files:

```sh
$ gofmt -w .
```


[go fmt]: {{ site.baseurl }}{% link cheatsheets/go/commands/fmt.md %}
[gofmt command]: https://golang.org/cmd/gofmt/
