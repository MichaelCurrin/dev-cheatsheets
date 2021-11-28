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

Show the filename.

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

Use `-P` for non-greedy support (available in Linux only). Pattern must be in Perl regex syntax.

Without `-P` flag:

```
https://
https://www.
https://
```

Without `-o` flag, you see the entire line, but with the match patterns highlighted (assuming colors are enabled).


## Advanced path matching

Use the `find` command to filter the paths and then apply `grep`.

Here we look for files named `index.md` which do not contain the text `foo`. And only show each path once.

```sh
$ grep -L foo $(find . -type f -name index.md )
```


## Search for a string starting with a dash

Say you are looking for flag `-m`.

You'll get an error with:

```sh
$ grep -m
```

So use double dash to signal end of flags:

```sh
$ grep -- -m
```


## Convert search results to an array

Grep will return results as a single multi-line string. This can be split into a Bash array like this.

```sh
$ MATCHES=($(grep -l -R needle .))
```

And the items (note index starts at one, not zero).

```sh
$ echo ${MATCHES[1]}
$ echo ${MATCHES[2]}
```

Use the `-l` flag to show paths of files and not the actual content matches.
