# Data manipulation

## Plain text data

```sh
SAMPLE_DATA='abc
def
def
xyz
def
abc
def'
```

e.g. 

```sh
$ echo "$SAMPLE_DATA" | uniq
```

### Unique

```sh
$ uniq
```

Add count.

```sh
$ uniq -c
```

Add count and sort by highest count first:

```sh
$ uniq -c | sort -r
```

Show name first and then count:

```sh
$ uniq -c | awk '{print $2, $1}'
```

### Sort

```sh
$ sort
```

Unique values.

```sh
$ sort -u
```

Reverse th eorder.

```sh
$ sort -r
```

