---
title: Output only matching
description: Return show the portion of the line that matches.
---

See also [thread](https://unix.stackexchange.com/questions/13466/can-grep-output-only-specified-groupings-that-match).

Flag:

```
     -o, --only-matching
             Prints only the matching part of the lines.
```

Usage:

```sh
$ grep -o FILE PATTERN
```


## Example

Given file:

- `go.mod`
    ```
    # ...
    
    go 1.16
    
    # ...
    ```

If you do a plain grep, you'll get the entire line. In color mode, only the number will be highlighted like `go **1.16**`.

```
go 1.16
    
    github.com/cpuguy83/go-md2man/v2 v2.0.1 // indirect
    github.com/urfave/cli/v2 v2.3.0
```

Also, that match is too broad on the other lines.

And using groups doesn't work. With with `-o`, the entire line is shown.

```console
$ egrep -o go.mod '(\d\.\d+)
go 1.16
```

But you can chain grep commands together.

```console
$ grep '^go' go.mod | egrep -o '(\d\.\d+)'
1.16
```
