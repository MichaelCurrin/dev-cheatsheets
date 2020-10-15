# CLI

## Usage

```
grep [options] [pattern] [file ...]
```


## Flags


| Short   | Long                 | Description                         |
| ------- | -------------------- | ----------------------------------- |
| -r, -R  | –recursive           | Recursive                           |
| -v      | –invert-match        | Invert match                        |
| -i      | –ignore-case         | Case insensitive                    |
| -A NUM  |                      | Print num lines of training context |
| -G      | –basic-regexp        | Basic regex (default).              |
| -E      | –extended-regexp     | Extended regex. Same as `egrep`.    |
| -P      | –perl-regexp         | Perl regular expression.            |
| -F      | –fixed-strings       | Same as `fgrep`.                    |
| -f PATH | –file PATH           | Get patterns for file.              |
| -h      | –no-filename         |
| -H      | –with-filename       |
| -l      | –files-with-matches  | Just print filenames.               |
| -L      | –files-without-match |



## Samples

Search recursively in current directory, case insenstively.

```sh
$ grep -ir PATTERN
```

Show filename.

```sh
$ grep -H foobar *
foo.txt:This is foobar
bar.txt:This is another match for the foobar pattern
```
