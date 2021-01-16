# Samples


## File

Search a file.

```sh
$ grep foo file.txt
```

Equivalent of:

```sh
$ cat file.text | grep foo
```


## Directory

Search recursively in current directory, case insensitively.

```sh
$ grep -ir PATTERN
```


## Filename

Show filename.

```sh
$ grep -H foobar *
foo.txt:This is foobar
bar.txt:This is another match for the foobar pattern
```


## URLs

Find URLs in a JSON which is only one line.

This uses a pattern I came up with - note it doesn't cover `?` or trailing `/`.

```sh
$ grep -Po "https:\/\/[\w./#-]*" file.txt
```

```
https://docs.mongodb.com/manual/core/data-model-design/
https://www.oreilly.com/library/view/50-tips-and/9781449306779/ch01.html
https://leetcode.com/
```

Use `-P` for non-greedy support. Pattern must be in Perl regex syntax.

Without `-P` flag:

```
https://
https://www.
https://
```

Without `-o` flag, you see the entire line, but with the match patterns highlighted (assuming colors are enabled).
