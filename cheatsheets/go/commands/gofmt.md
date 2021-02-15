# gofmt

Docs: [gofmt](https://golang.org/cmd/gofmt/) command.

For general, use should probably use `go fmt`. Unless you need the control of `gofmt`.


## Usage

```
gofmt [flags] [path ...]
```

For path:

- Supply a module name like `hello.go`.
- Use current directory as `.` - this works recursively.
- If you omit path, then it reads on stdin.


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


## Examples

Update file in place without listing them.

```sh
$ gofmt -w hello.go
```

Dry-run, or check, by omitting `-w`. Using `-d` shows a diff as `-` and `+` to make the output more readable.

```sh
$ gofmt -d .
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
