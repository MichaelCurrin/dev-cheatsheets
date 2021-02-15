# Match types


## Basic

Find word.

```sh
grep foo PATH
```


## Exact match

```sh
grep -w 'foo' bar.txt
```


## Invert match

```sh
grep -v 'foo' bar.txt
```

That will invert the match on each line.

If you want to want to find entire files which do not match a pattern, use:

```sh
grep -L 'foo' bar.txt baz.txt
```
